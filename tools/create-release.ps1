<#
.SYNOPSIS
    Create (or update) the GitHub Release for a Galaxy Castle build and attach the zip — no browser needed.

.DESCRIPTION
    Uploads the zip produced by tools/package-release.ps1 to GitHub Releases through the REST API.
    The tag must already exist on the remote, so push first:

        git push origin main --tags

.EXAMPLE
    # 1) install the token in the environment once, for this session only
    $env:GITHUB_TOKEN = 'ghp_xxxxxxxxxxxxxxxx'

    # 2) create the release (v0.4.0 by default)
    .\tools\create-release.ps1

.EXAMPLE
    # preview the request without touching the network
    .\tools\create-release.ps1 -DryRun

.EXAMPLE
    # explicit token, different version
    .\tools\create-release.ps1 -Version 0.5 -Token ghp_xxxxxxxx
#>
[CmdletBinding()]
param(
    [string]$Version = '0.4',
    [string]$Tag = '',
    [string]$Repo = 'hanghangworker-ui/Galaxy-Castle',
    [string]$Token = $env:GITHUB_TOKEN,
    [string]$Asset,
    [string]$NotesFile,
    [switch]$Prerelease,
    [switch]$DryRun
)

$ErrorActionPreference = 'Stop'
$root = Split-Path -Parent $PSScriptRoot

if (-not $Tag) { $Tag = "v$Version.0" }
if (-not $Asset) { $Asset = Join-Path $root "dist\GalaxyCastle_Demo_v${Version}_Windows.zip" }
if (-not $NotesFile) { $NotesFile = Join-Path $root "docs\release-notes-$Tag.md" }

"Release tag : $Tag"
"Repository  : $Repo"
"Asset       : $Asset"

if (-not (Test-Path -LiteralPath $Asset)) {
    throw "Asset not found: $Asset`nRun .\tools\package-release.ps1 -Version $Version first."
}
if (-not (Test-Path -LiteralPath $NotesFile)) {
    throw "Release notes not found: $NotesFile"
}

$assetItem = Get-Item -LiteralPath $Asset
$sha256 = (Get-FileHash -LiteralPath $Asset -Algorithm SHA256).Hash
$sizeMb = [math]::Round($assetItem.Length / 1MB, 1)

$body = (Get-Content -LiteralPath $NotesFile -Raw).TrimEnd()
$body += @"


---

**Download:** ``$($assetItem.Name)`` — $sizeMb MB
**SHA256:** ``$sha256``
"@

$payload = @{
    tag_name               = $Tag
    name                   = "Galaxy Castle — $Tag"
    body                   = $body
    draft                  = $false
    prerelease             = [bool]$Prerelease
    generate_release_notes = $false
} | ConvertTo-Json -Depth 4

if ($DryRun) {
    "--- dry run: no network calls ---"
    "POST https://api.github.com/repos/$Repo/releases"
    "POST https://uploads.github.com/repos/$Repo/releases/<id>/assets?name=$($assetItem.Name)"
    $payload
    return
}

if (-not $Token) {
    throw "No token. Set `$env:GITHUB_TOKEN or pass -Token.`nCreate one at https://github.com/settings/tokens (classic, scope: repo)."
}

[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
$headers = @{
    Authorization          = "Bearer $Token"
    Accept                 = 'application/vnd.github+json'
    'X-GitHub-Api-Version' = '2022-11-28'
    'User-Agent'           = 'GalaxyCastle-release-script'
}

# The release is attached to a tag, so the tag has to exist on the remote already.
try {
    $null = Invoke-RestMethod -Uri "https://api.github.com/repos/$Repo/git/ref/tags/$Tag" -Headers $headers -Method Get
} catch {
    throw "Tag $Tag is not on GitHub yet. Run: git push origin main --tags  (then retry)."
}

"Creating release $Tag ..."
$release = Invoke-RestMethod -Uri "https://api.github.com/repos/$Repo/releases" -Headers $headers -Method Post `
    -ContentType 'application/json; charset=utf-8' -Body ([Text.Encoding]::UTF8.GetBytes($payload))
"Release created: $($release.html_url)"

"Uploading $($assetItem.Name) ($sizeMb MB) ..."
$uploadUrl = "https://uploads.github.com/repos/$Repo/releases/$($release.id)/assets?name=$([uri]::EscapeDataString($assetItem.Name))"
$uploadHeaders = $headers.Clone()
$uploadHeaders['Content-Type'] = 'application/zip'
$assetInfo = Invoke-RestMethod -Uri $uploadUrl -Headers $uploadHeaders -Method Post -InFile $assetItem.FullName

"Asset uploaded: $($assetInfo.browser_download_url)"
"Done: $($release.html_url)"
