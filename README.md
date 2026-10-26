<div align="center">

<img src="docs/banner.png" alt="Galaxy Castle — first playable demo" width="100%" />

# Galaxy Castle

**A 10–15 minute 2D action-platformer demo. Dash, parry, and flip gravity to walk on the ceiling — then face the Gatewarden.**

`v0.1 · The Fallen Gate` &nbsp;·&nbsp; Windows 10/11 (x64) &nbsp;·&nbsp; Made with Godot 4.7

[![Platform](https://img.shields.io/badge/platform-Windows%2010%2F11%20x64-0078D6?logo=windows&logoColor=white)](#requirements)
[![Engine](https://img.shields.io/badge/engine-Godot%204.7-478CBF?logo=godotengine&logoColor=white)](#built-with)
[![Demo](https://img.shields.io/badge/demo-v0.1%20The%20Fallen%20Gate-8B5CF6)](CHANGELOG.md)
[![Status](https://img.shields.io/badge/status-playable%20demo-F59E0B)](#roadmap)

[English](README.md) &nbsp;·&nbsp; [简体中文](README.zh-CN.md)

</div>

## Overview

**Galaxy Castle** is a side-scrolling action-platformer about Lune, a small guardian, and a castle that fell out of the sky. You run, wall-jump, dash through danger and parry with a glaive — and when the floor runs out, you **flip gravity** and keep fighting on the ceiling.

This repository hosts the first playable demo, **v0.1 “The Fallen Gate”**: one short chapter (about 10–15 minutes) built to prove the feel of movement, combat and the gravity mechanic before the full game goes into production.

> **Just want to play?** Download the zip from [Releases](../../releases), extract it anywhere and double-click **`play.bat`**.

<!--
SCREENSHOTS — drop 1280×720 PNGs into docs/screenshots/ and replace this comment with:

| The Fallen Gate | The Gatewarden |
| :---: | :---: |
| ![Gameplay](docs/screenshots/01-gameplay.png) | ![Boss](docs/screenshots/02-gatewarden.png) |

See docs/screenshots/README.md for the file-naming and size guidelines.
-->

## What's in the demo

- **Movement** — run, jump (hold for height), wall-jump, and an invincible dash.
- **Combat** — 3-hit glaive combo, up/down attacks, down-attack bounce, parry, and a held heal powered by Starlight.
- **Gravity Core** — the signature ability: flip gravity and walk on the ceiling to cross the spike pit.
- **Enemies** — the Husk (patrol + claw lunge) and the Wisp (flying charge).
- **Boss** — the Gatewarden: slam, charge and leap shockwaves; phase 2 adds Star Rain.
- **Checkpoints** — Starwells, Stardust pickups, and Echo, who returns your Stardust after you die.
- **Presentation** — placeholder art and SFX, two music loops, controller rumble, keyboard and Xbox-layout gamepad support.

## Controls

| Action | Keyboard | Gamepad (Xbox layout) |
| --- | --- | --- |
| Move | `A` `D` / arrow keys | Left stick / D-pad |
| Aim attack up / down | `W` `S` / arrow keys | Left stick |
| Jump (hold = higher) | `Space` / `Z` | `A` |
| Attack (3-hit combo) | `J` / `X` | `X` |
| Dash (invincible) | `K` / `C` / `Shift` | `B` / `RT` |
| Parry | `L` / `V` | `RB` |
| Heal (hold) | `F` | `Y` |
| Flip gravity | `E` / `G` | `LB` / `LT` |
| Pause + control list | `Esc` / `P` | `Start` |
| Fullscreen | `F11` | — |

## Play it

### Requirements

- Windows 10 or 11, 64-bit
- ~250 MB of free disk space
- A keyboard, or a controller in Xbox layout

### Option A — Download (recommended)

1. Open [Releases](../../releases) and download `GalaxyCastle_Demo_v0.1_Windows.zip`.
2. Extract the archive (do not run the game from inside the zip).
3. Double-click **`play.bat`**.

### Option B — Clone the repository

```bash
git clone https://github.com/hanghangworker-ui/Galaxy-Castle.git
cd Galaxy-Castle
```

Then double-click `play.bat` — or run `./play.bat` from a terminal.

### First launch

`play.bat` joins the four pieces in `data/` into `GalaxyCastle.exe` (about 105 MB — a few seconds), then starts the game. After that you can also launch `GalaxyCastle.exe` directly.

> **“Windows protected your PC”** is expected: the demo is not code-signed yet. Click **More info → Run anyway**. Signing arrives with the Steam release.

> The assembled `GalaxyCastle.exe` is deliberately **not** committed — see the [FAQ](#faq) — so a fresh clone has no executable until the first launch. That's normal.

## Repository layout

```
Galaxy-Castle/
├── play.bat                  # starts the game (assembles the exe on first run)
├── data/
│   ├── GalaxyCastle.exe.001  # the Godot export, split into 4 parts
│   ├── GalaxyCastle.exe.002
│   ├── GalaxyCastle.exe.003
│   └── GalaxyCastle.exe.004
├── docs/
│   ├── banner.png            # README header image
│   ├── social-preview.png    # GitHub → Settings → Social preview
│   ├── PUBLISHING.md         # how the repo is set up, how to publish a build
│   └── screenshots/
├── tools/
│   ├── gen-banner.ps1        # regenerates banner.png and social-preview.png
│   ├── split-build.ps1       # splits a new Godot export into data/*.001–004
│   └── package-release.ps1   # builds the zip attached to a GitHub Release
├── CHANGELOG.md
├── README.md
└── README.zh-CN.md
```

## Built with

- [Godot Engine 4.7](https://godotengine.org/) — Windows x64 export
- Placeholder art, sound effects and two music loops, all generated in code

## Roadmap

- [x] First playable demo — movement, combat, gravity, one boss
- [ ] Replace placeholder art, SFX and music
- [ ] Second ability and new areas
- [ ] Settings and save system, controller remapping
- [ ] Code-signed Steam build

## Known issues

- Windows only for now — no macOS or Linux build.
- The executable is unsigned, so Windows SmartScreen warns on first run.
- All art, SFX and music are placeholders.
- No save system yet: progress lives only for the session (Starwell checkpoints included).

## FAQ

<details>
<summary><strong>Why is the .exe split into four files?</strong></summary>

GitHub blocks files larger than 100 MB. The Godot export is about 105 MB, so it is stored as `data/GalaxyCastle.exe.001` … `.004` (≈27 MB each) and reassembled by `play.bat` on first launch. Each part stays below the limit, and the repository remains cloneable with a normal `git clone`.

</details>

<details>
<summary><strong>Why isn't the executable in the repository?</strong></summary>

`GalaxyCastle.exe` is a generated artifact: it is byte-identical to the concatenation of the four parts. Committing it would double the repository size for no benefit, so it is listed in `.gitignore`. If you prefer a single-file download, grab the zip from [Releases](../../releases) instead.

</details>

<details>
<summary><strong>Can I use Git LFS instead?</strong></summary>

Yes. Git LFS keeps large binaries out of the normal Git history, at the cost of an extra install step for anyone cloning. See [docs/PUBLISHING.md](docs/PUBLISHING.md#working-with-large-binaries) for the trade-offs and the commands.

</details>

## Feedback

Bug reports, balance notes and “this jump feels wrong” feedback are all welcome — please open an [issue](../../issues). Source code is not public yet, so pull requests are not accepted for now.

## License

This demo is **not** released under an open-source license yet. Unless a `LICENSE` file is added, all rights are reserved by the author — the game, its code, art and audio included. If you would like others to reuse it, add a `LICENSE` file (MIT or Apache-2.0 for code, CC BY-NC 4.0 for assets) and update this section.
