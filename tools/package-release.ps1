# Builds the zip that is attached to a GitHub Release.
#
# Usage (from anywhere):
#   pwsh -File tools/package-release.ps1
#   pwsh -File tools/package-release.ps1 -Version 0.2.0
#
# Output: dist/GalaxyCastle_Demo_v<version>_Windows.zip
param(
  [string]$Version = '0.4'
)

$ErrorActionPreference = 'Stop'

$root = (Resolve-Path -LiteralPath (Join-Path $PSScriptRoot '..')).Path
$outDir = Join-Path $root 'dist'
$zipName = "GalaxyCastle_Demo_v${Version}_Windows.zip"
$zipPath = Join-Path $outDir $zipName
$folderName = "GalaxyCastle_Demo_v${Version}_Windows"

New-Item -ItemType Directory -Force -Path $outDir | Out-Null
if (Test-Path -LiteralPath $zipPath) { Remove-Item -LiteralPath $zipPath -Force }

$stage = Join-Path ([System.IO.Path]::GetTempPath()) ("gc-release-" + [guid]::NewGuid().ToString('N'))
$target = Join-Path $stage $folderName
New-Item -ItemType Directory -Force -Path $target | Out-Null

try {
  # Game files
  Copy-Item -LiteralPath (Join-Path $root 'play.bat') -Destination $target
  Copy-Item -LiteralPath (Join-Path $root 'README.md') -Destination $target
  Copy-Item -LiteralPath (Join-Path $root 'data') -Destination $target -Recurse

  # Prefer the assembled executable; fall back to rebuilding it from the parts.
  $exe = Join-Path $root 'GalaxyCastle.exe'
  if (Test-Path -LiteralPath $exe) {
    Copy-Item -LiteralPath $exe -Destination $target
  }
  else {
    $buffer = Join-Path $stage 'GalaxyCastle.exe'
    $out = [System.IO.File]::Create($buffer)
    try {
      foreach ($i in 1..4) {
        $part = Join-Path $root ('data\GalaxyCastle.exe.{0:D3}' -f $i)
        $in = [System.IO.File]::OpenRead($part)
        try { $in.CopyTo($out) } finally { $in.Dispose() }
      }
    }
    finally { $out.Dispose() }
    Move-Item -LiteralPath $buffer -Destination (Join-Path $target 'GalaxyCastle.exe')
  }

  Compress-Archive -Path $target -DestinationPath $zipPath -CompressionLevel Optimal
}
finally {
  if (Test-Path -LiteralPath $stage) { Remove-Item -LiteralPath $stage -Recurse -Force }
}

$size = (Get-Item -LiteralPath $zipPath).Length / 1MB
Write-Host ("Created {0} ({1:N1} MB)" -f $zipPath, $size)
Write-Host "Upload it on GitHub: Releases -> Draft a new release -> tag v$Version -> attach this zip."
