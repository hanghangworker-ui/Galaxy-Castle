# Generates the README banner + GitHub social preview for Galaxy Castle.
# Usage: pwsh -File tools/gen-banner.ps1 -OutDir <path>
param(
  [string]$OutDir = (Join-Path $PSScriptRoot '..\docs'),
  [string]$DemoLabel = 'playable demo v0.10'
)

Add-Type -AssemblyName System.Drawing
$ErrorActionPreference = 'Stop'

function New-Color([int]$a, [int]$r, [int]$g, [int]$b) {
  [System.Drawing.Color]::FromArgb($a, $r, $g, $b)
}

function Draw-Spaced {
  param(
    [System.Drawing.Graphics]$G, [string]$Text, [System.Drawing.Font]$Font,
    [System.Drawing.Brush]$Brush, [float]$X, [float]$Y, [float]$Spacing
  )
  $fmt = [System.Drawing.StringFormat]::GenericTypographic
  $cx = $X
  foreach ($ch in $Text.ToCharArray()) {
    $s = [string]$ch
    if ($s -ne ' ') { $G.DrawString($s, $Font, $Brush, $cx, $Y, $fmt) }
    $w = $G.MeasureString($s, $Font, [System.Drawing.PointF]::new(0, 0), $fmt).Width
    $cx += $w + $Spacing
  }
  return $cx
}

function New-GalaxyCastleImage {
  param([int]$W, [int]$H, [string]$OutPath)

  $bmp = New-Object System.Drawing.Bitmap($W, $H)
  $g = [System.Drawing.Graphics]::FromImage($bmp)
  $g.SmoothingMode = [System.Drawing.Drawing2D.SmoothingMode]::AntiAlias
  $g.TextRenderingHint = [System.Drawing.Text.TextRenderingHint]::AntiAliasGridFit
  $g.PixelOffsetMode = [System.Drawing.Drawing2D.PixelOffsetMode]::HighQuality

  # --- background -------------------------------------------------------
  $rect = New-Object System.Drawing.Rectangle(0, 0, $W, $H)
  $bg = New-Object System.Drawing.Drawing2D.LinearGradientBrush($rect, [System.Drawing.Color]::Black, [System.Drawing.Color]::Black, 90)
  $blend = New-Object System.Drawing.Drawing2D.ColorBlend(4)
  $blend.Colors = @(
    (New-Color 255 4 5 12),
    (New-Color 255 9 12 38),
    (New-Color 255 17 9 40),
    (New-Color 255 6 4 16)
  )
  $blend.Positions = @(0.0, 0.42, 0.78, 1.0)
  $bg.InterpolationColors = $blend
  $g.FillRectangle($bg, $rect)

  # --- stars ------------------------------------------------------------
  $rand = New-Object System.Random(20261029)
  for ($i = 0; $i -lt 190; $i++) {
    $x = $rand.Next(0, $W)
    $y = $rand.Next(0, $H)
    $r = 0.4 + ($rand.NextDouble() * 1.5)
    $a = 25 + $rand.Next(0, 200)
    $tint = $rand.Next(0, 100)
    if ($tint -lt 70) { $c = New-Color $a 235 235 255 }
    elseif ($tint -lt 88) { $c = New-Color $a 190 170 255 }
    else { $c = New-Color $a 255 225 190 }
    $b = New-Object System.Drawing.SolidBrush($c)
    $g.FillEllipse($b, [float]($x - $r), [float]($y - $r), [float]($r * 2), [float]($r * 2))
    $b.Dispose()
  }

  # --- layout -----------------------------------------------------------
  $blockH = 400
  $top = [float](($H - $blockH) / 2.0)
  $cx = [float]($W - [Math]::Min(320, $W * 0.25))
  $cy = [float]($top + 200)
  $R = [float]([Math]::Min(128, $H * 0.30))
  $left = [float]([Math]::Max(72, $W * 0.075))

  # glow behind the gate
  $path = New-Object System.Drawing.Drawing2D.GraphicsPath
  $path.AddEllipse([float]($cx - $R * 2.2), [float]($cy - $R * 2.2), [float]($R * 4.4), [float]($R * 4.4))
  $pgb = New-Object System.Drawing.Drawing2D.PathGradientBrush($path)
  $pgb.CenterColor = New-Color 120 108 74 255
  $pgb.SurroundColors = @((New-Color 0 108 74 255))
  $g.FillPath($pgb, $path)
  $pgb.Dispose(); $path.Dispose()

  # the gate: concentric rings
  $rings = @(
    @{ R = $R * 1.42; W = 1.0; A = 46 },
    @{ R = $R * 1.22; W = 1.2; A = 78 },
    @{ R = $R * 1.02; W = 2.0; A = 150 },
    @{ R = $R * 0.80; W = 1.0; A = 70 }
  )
  foreach ($ring in $rings) {
    $pen = New-Object System.Drawing.Pen((New-Color $ring.A 176 150 255), [float]$ring.W)
    $g.DrawEllipse($pen, [float]($cx - $ring.R), [float]($cy - $ring.R), [float]($ring.R * 2), [float]($ring.R * 2))
    $pen.Dispose()
  }
  # bright arc on the gate
  $arcPen = New-Object System.Drawing.Pen((New-Color 210 214 196 255), 3.0)
  $arcPen.StartCap = [System.Drawing.Drawing2D.LineCap]::Round
  $arcPen.EndCap = [System.Drawing.Drawing2D.LineCap]::Round
  $g.DrawArc($arcPen, [float]($cx - $R), [float]($cy - $R), [float]($R * 2), [float]($R * 2), 205, 250)
  $arcPen.Dispose()

  # orbiting sparks
  $sparkPen = New-Object System.Drawing.Pen((New-Color 120 235 220 255), 1.0)
  for ($i = 0; $i -lt 3; $i++) {
    $ang = -0.6 + $i * 2.1
    $rr = $R * (1.18 + $i * 0.12)
    $sx = [float]($cx + [Math]::Cos($ang) * $rr)
    $sy = [float]($cy + [Math]::Sin($ang) * $rr)
    $sb = New-Object System.Drawing.SolidBrush((New-Color 230 236 224 255))
    $g.FillEllipse($sb, [float]($sx - 2.2), [float]($sy - 2.2), 4.4, 4.4)
    $sb.Dispose()
  }
  $sparkPen.Dispose()

  # --- type -------------------------------------------------------------
  $spaced = [System.Drawing.StringFormat]::GenericTypographic
  $flat = New-Object System.Drawing.StringFormat
  $flat.Alignment = [System.Drawing.StringAlignment]::Near
  $flat.LineAlignment = [System.Drawing.StringAlignment]::Near

  $eyebrow = New-Object System.Drawing.Font('Segoe UI Semibold', 15, [System.Drawing.FontStyle]::Regular, [System.Drawing.GraphicsUnit]::Pixel)
  $eyebrowBrush = New-Object System.Drawing.SolidBrush((New-Color 255 168 143 233))
  [void](Draw-Spaced -G $g -Text 'THE FALLEN GATE' -Font $eyebrow -Brush $eyebrowBrush -X $left -Y ([float]($top + 78)) -Spacing 5.5)
  $eyebrowBrush.Dispose(); $eyebrow.Dispose()

  $titleFont = New-Object System.Drawing.Font('Segoe UI Black', 92, [System.Drawing.FontStyle]::Regular, [System.Drawing.GraphicsUnit]::Pixel)
  $titleRect = New-Object System.Drawing.RectangleF([float]$left, [float]($top + 104), [float]($W * 0.55), 200)
  $titleBrush = New-Object System.Drawing.Drawing2D.LinearGradientBrush(
    $titleRect, (New-Color 255 255 255 255), (New-Color 255 176 150 255), 90)
  [void](Draw-Spaced -G $g -Text 'GALAXY' -Font $titleFont -Brush $titleBrush -X $left -Y ([float]($top + 100)) -Spacing 9)
  [void](Draw-Spaced -G $g -Text 'CASTLE' -Font $titleFont -Brush $titleBrush -X $left -Y ([float]($top + 186)) -Spacing 9)
  $titleBrush.Dispose(); $titleFont.Dispose()

  $rulePen = New-Object System.Drawing.Pen((New-Color 130 96 84 190), 1.0)
  $g.DrawLine($rulePen, $left, [float]($top + 306), [float]($left + 430), [float]($top + 306))
  $rulePen.Dispose()

  $subFont = New-Object System.Drawing.Font('Segoe UI', 19, [System.Drawing.FontStyle]::Regular, [System.Drawing.GraphicsUnit]::Pixel)
  $subBrush = New-Object System.Drawing.SolidBrush((New-Color 255 214 209 238))
  $g.DrawString("2D action-platformer  ·  $DemoLabel", $subFont, $subBrush, $left, [float]($top + 320), $flat)
  $subBrush.Dispose(); $subFont.Dispose()

  $footFont = New-Object System.Drawing.Font('Segoe UI Semibold', 12, [System.Drawing.FontStyle]::Regular, [System.Drawing.GraphicsUnit]::Pixel)
  $footBrush = New-Object System.Drawing.SolidBrush((New-Color 255 128 126 165))
  $footY = [float]($top + 362)
  $endX = Draw-Spaced -G $g -Text 'WINDOWS 10 / 11 x64' -Font $footFont -Brush $footBrush -X $left -Y $footY -Spacing 2.6
  $dotX = [float]($endX + 12)
  $dotBrush = New-Object System.Drawing.SolidBrush((New-Color 170 150 120 255))
  $g.FillEllipse($dotBrush, $dotX, [float]($footY + 8), 3, 3)
  $dotBrush.Dispose()
  [void](Draw-Spaced -G $g -Text 'MADE WITH GODOT 4.7' -Font $footFont -Brush $footBrush -X ([float]($dotX + 15)) -Y $footY -Spacing 2.6)
  $footBrush.Dispose()
  $footFont.Dispose()

  # vignette-ish bottom fade
  $fadeRect = New-Object System.Drawing.Rectangle(0, [int]($H * 0.82), $W, [int]($H * 0.18 + 1))
  $fade = New-Object System.Drawing.Drawing2D.LinearGradientBrush(
    $fadeRect, (New-Color 0 0 0 0), (New-Color 90 2 2 8), 90)
  $g.FillRectangle($fade, $fadeRect)
  $fade.Dispose()

  $flat.Dispose()
  $g.Dispose()
  $bmp.Save($OutPath, [System.Drawing.Imaging.ImageFormat]::Png)
  $bmp.Dispose()
  Write-Host "wrote $OutPath"
}

New-Item -ItemType Directory -Force -Path $OutDir | Out-Null
New-GalaxyCastleImage -W 1280 -H 400 -OutPath (Join-Path $OutDir 'banner.png')
New-GalaxyCastleImage -W 1280 -H 640 -OutPath (Join-Path $OutDir 'social-preview.png')
