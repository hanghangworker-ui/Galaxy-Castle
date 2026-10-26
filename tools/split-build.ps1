# Splits a Godot export into <100 MB chunks so the build can live in a Git repo.
#
# Usage (from the repository root):
#   pwsh -File tools/split-build.ps1 -Exe "C:\path\to\GalaxyCastle.exe"
#
# The chunks land in data/ and are reassembled by play.bat on first launch.
param(
  [Parameter(Mandatory = $true)]
  [string]$Exe,

  [string]$OutDir = (Join-Path (Split-Path -Parent $PSScriptRoot) 'data'),

  [int]$PartSizeMB = 27
)

$ErrorActionPreference = 'Stop'

if (-not (Test-Path -LiteralPath $Exe)) {
  throw "Executable not found: $Exe"
}

$source = (Resolve-Path -LiteralPath $Exe).Path
$totalBytes = (Get-Item -LiteralPath $source).Length
$partSize = $PartSizeMB * 1MB

New-Item -ItemType Directory -Force -Path $OutDir | Out-Null
Get-ChildItem -LiteralPath $OutDir -Filter 'GalaxyCastle.exe.*' -File |
  Where-Object { $_.Name -match '\.\d{3}$' } |
  Remove-Item -Force

$in = [System.IO.File]::OpenRead($source)
$buffer = New-Object byte[] ($partSize)
$index = 1
$written = 0

try {
  while ($true) {
    $read = 0
    while ($read -lt $partSize) {
      $n = $in.Read($buffer, $read, $partSize - $read)
      if ($n -le 0) { break }
      $read += $n
    }
    if ($read -eq 0) { break }

    $partName = 'GalaxyCastle.exe.{0:D3}' -f $index
    $partPath = Join-Path $OutDir $partName
    $out = [System.IO.File]::Create($partPath)
    try { $out.Write($buffer, 0, $read) } finally { $out.Dispose() }

    Write-Host ("{0}  {1:N1} MB" -f $partName, ($read / 1MB))
    $written += $read
    $index++
    if ($read -lt $partSize) { break }
  }
}
finally {
  $in.Dispose()
}

if ($written -ne $totalBytes) {
  throw "Split failed: wrote $written of $totalBytes bytes."
}

Write-Host ""
Write-Host ("Done: {0} part(s), {1:N1} MB total, source {2}" -f ($index - 1), ($totalBytes / 1MB), $source)
Write-Host "Commit data/ and bump the version in CHANGELOG.md."
