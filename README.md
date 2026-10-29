<div align="center">

<img src="docs/banner.png" alt="Galaxy Castle — playable demo v0.10" width="100%" />

# Galaxy Castle

**A ~90-minute 2D action-platformer demo. 37 rooms, false walls that hide real treasure, Orbit Rail fast travel, a Silksong-style map from Orrin the Cartographer — and this build finally gives every floating stone a chain to hang from.**

`v0.10 · The Fallen Gate` &nbsp;·&nbsp; Windows 10/11 (x64) &nbsp;·&nbsp; Made with Godot 4.7

[![Platform](https://img.shields.io/badge/platform-Windows%2010%2F11%20x64-0078D6?logo=windows&logoColor=white)](#play-it)
[![Engine](https://img.shields.io/badge/engine-Godot%204.7-478CBF?logo=godotengine&logoColor=white)](#built-with)
[![Demo](https://img.shields.io/badge/demo-v0.10%20The%20Fallen%20Gate-8B5CF6)](CHANGELOG.md)
[![Status](https://img.shields.io/badge/status-playable%20demo-F59E0B)](#roadmap)

[English](README.md) &nbsp;·&nbsp; [简体中文](README.zh-CN.md)

</div>

## Overview

**Galaxy Castle** is a side-scrolling action-platformer about Lune, a small guardian, and a castle that fell out of the sky. You run, jump and parry with a glaive — and when the floor runs out, you **flip gravity** and keep fighting on the ceiling.

This repository hosts the **third public build, v0.10**: *The Fallen Gate* has grown to **37 rooms** across three wings — the battlements above and the sunken crypts below — with false walls that look exactly like stone until your glaive rings them, Orrin the Cartographer selling you a Silksong-style map, and the Orbit Rail fast-travelling you between attuned stations. Roughly **1.5 hours** of content, all of it inside one region.

> **Just want to play?** Grab the zip from [Releases](../../releases), unpack it and double-click **`play.bat`**.

## Screenshots

| Title screen | Orrin's map, rough + detail |
| :---: | :---: |
| ![Title screen](docs/screenshots/01-title-screen.png) | ![Orrin's map](docs/screenshots/17-map-rough-detail.png) |
| **The Gatewarden's hall** | **Thorn Gauntlet** |
| ![The Gatewarden's hall](docs/screenshots/09-boss-fight.png) | ![Thorn Gauntlet](docs/screenshots/31-thorn-gauntlet.png) |

Thirty-three more captures in [docs/screenshots](docs/screenshots/) — the climbing well, gravity flips, the enemy test room, the sealed catacomb, every boss phase.

## What's new in v0.10

- **Logical structures, rebuilt.** Every stairwell (Climbing Well, Barbican, Starfall Stair) is now a proper stair shaft: ledges anchored in the walls, short platforms hanging on chains. No floating slabs, no step blocks under openings, no one-tile slots. The level generator now refuses all of them.
- **False walls that fool you.** No cracks, no glint — the only tell is *sound*: true stone **rings** under the glaive, false stone **thuds** and cracks. What's behind one is drawn as solid rock until the wall breaks, then fades in. Hidden rooms stay off Orrin's map until you find them.
- **Secrets with different rewards** — a Star Relic (brass astrolabe), Comet Ore, a Stardust hoard (+25), a stone tablet you press **Up** at to read, Heart Fragments and Constellation Shards. The HUD counts Relics and Ore.
- **Day 8: the Garrison (rooms 26–37)** — the Drill Yard, a lever that drops the Garrison Gate's portcullis, the Sally Port looping back to the Starfall Stair, and a new Watch Post with the fourth Orbit Rail station.
- **Two new enemies from data files** — the **Husk Brute** (big, slow, 7 health, hits for 2) and the **Ember Wisp** (fast, fragile, short warning).
- **Two challenge rooms**, optional like Hollow Knight's trials: **Thorn Gauntlet** (50 tiles of spikes crossed on pillars and hanging platforms) and the **Trial Arena** (three waves; the vault holds Comet Ore, Stardust and a tablet).
- **Scale:** 37 rooms, **24,753 playable tiles — 8.1× the size of v0.5's Fallen Gate** (Day 9 reaches 10×).

v0.9, v0.8, v0.7 and v0.6 are internal steps between public builds — the full history (rooms 5 → 12 → 25 → 37, maps, fast travel, data-driven enemies, Starwell rests) is in [CHANGELOG.md](CHANGELOG.md).

## What's in the demo (~1.5 hours)

- **Lune** — run, jump (hold for height), 3-hit glaive combo, up/down attacks, down-attack bounce, parry, heal with Starlight. **Star Dash** is the Gatewarden's reward; **wall-jump** and **gravity flip** come in later regions — the demo plays out the full ability order.
- **37 rooms** across three wings: shortcuts, a lever-opened portcullis, false walls and false floors, three hidden rooms, two challenge rooms, and "come back later" spots you can see but not reach yet.
- **Rewards** — Stardust, caches and hoards, Heart Fragments (4 add a health pip), Constellation Shards, Star Relics, Comet Ore, stone tablets.
- **Enemies** — Husk (patrol + claw lunge), Husk Brute, Wisp (flying charge), Ember Wisp, Spore Bloom (petal glow, spore fan, poison clouds) and Vine Crawler (wraps platforms, turns at spikes). All defined in data files.
- **Boss** — the Gatewarden: slam, charge and leap shockwaves; phase 2 adds Star Rain.
- **Systems** — Starwells you rest at (health refills, enemies respawn), Orrin's map with pins, Orbit Rail fast travel (4 stations), 3 save slots, and Echo, who returns your Stardust after you die.
- **Enemy Test Room** — reachable from the main menu, every move unlocked, not a real level, not saved; it will be hidden before release.

## Controls

| Action | Keyboard | Gamepad (Xbox layout) |
| --- | --- | --- |
| Move | `A` `D` / arrow keys | Left stick / D-pad |
| Aim attack up / down | `W` `S` / arrow keys | Left stick |
| Jump (hold = higher) | `Space` / `Z` | `A` |
| Attack (3-hit combo) | `J` / `X` | `X` |
| Dash *(after the Gatewarden)* | `K` / `C` / `Shift` | `B` / `RT` |
| Parry | `L` / `V` | `RB` |
| Heal (hold) | `F` | `Y` |
| Flip gravity *(later region)* | `E` / `G` | `LB` / `LT` |
| Map + fast travel | `Tab` / `M` | Back / View |
| Pause + control list | `Esc` / `P` | `Start` |
| Fullscreen | `F11` | — |

Every action can be rebound in **Settings → Controls**.

## Play it

### Requirements

- Windows 10 or 11, 64-bit
- ~250 MB of free disk space
- A keyboard, or a controller in Xbox layout

### Option A — Download (recommended)

1. Open [Releases](../../releases) and download `GalaxyCastle_Demo_v0.10_Windows.zip` (older public builds — v0.4 and v0.1 — are still there if you want to compare).
2. Extract the archive — don't run the game from inside the zip.
3. Double-click **`play.bat`**.

### Option B — Clone the repository

```bash
git clone https://github.com/hanghangworker-ui/Galaxy-Castle.git
cd Galaxy-Castle
```

Then double-click `play.bat` — or run `./play.bat` from a terminal.

### First launch

`play.bat` joins the eleven pieces in `data/` into `GalaxyCastle.exe` (about 105 MB — a few seconds), then starts the game. After that you can launch `GalaxyCastle.exe` directly.

> **"Windows protected your PC"** is expected: the demo is not code-signed yet. Click **More info → Run anyway**. Signing arrives with the Steam release.

> The assembled `GalaxyCastle.exe` is deliberately **not** committed (see the [FAQ](#faq)), so a fresh clone has no executable until the first launch. That's normal.

## Version history

| Build | What changed | Release |
| --- | --- | --- |
| **v0.10** | 37 rooms, logical-structure rebuild, false walls, the Garrison, two new enemies, two challenge rooms | `v0.10.0` |
| v0.9 | 25 rooms, ability order follows the design document, "come back later" spots | internal |
| v0.8 | Data-driven enemies, Enemy Test Room, Spore Bloom and Vine Crawler | internal |
| v0.7 | Starwell rests, different rewards, smarter enemies | internal |
| v0.6 | 12 rooms, Silksong-style map from Orrin the Cartographer | internal |
| v0.5 | Map + Orbit Rail fast travel, map pins | internal |
| v0.4 | Main menu, 3 save slots, settings with key rebinding, pause menu, camera zones | `v0.4.0` |
| v0.3 | *The Fallen Gate* split into five connected rooms | internal |
| v0.2 | Full art pass: animated characters, textured levels, parallax backgrounds | internal |
| v0.1 | First playable demo — movement, combat, gravity, one boss | `v0.1.0` |

v0.1, v0.4 and v0.10 are tagged and published as releases; the rest were internal steps on the way here. Full notes in [CHANGELOG.md](CHANGELOG.md).

## Repository layout

```
Galaxy-Castle/
├── play.bat                  # starts the game (assembles the exe on first run)
├── data/
│   ├── GalaxyCastle.exe.001  # the Godot export, split into 11 parts (~10 MB each)
│   ├── ...                   #        .002 – .011
│   └── GalaxyCastle.exe.011
├── docs/
│   ├── banner.png            # README header image
│   ├── social-preview.png    # GitHub → Settings → Social preview
│   ├── ART_GUIDE.md          # how to replace any character part with your own PNG
│   ├── PUBLISHING.md         # repo setup, releases, large files
│   └── screenshots/          # 31 in-game captures
├── tools/
│   ├── gen-banner.ps1        # regenerates banner.png and social-preview.png
│   ├── split-build.ps1       # splits a new Godot export into data/*.001–011
│   ├── package-release.ps1   # builds the zip attached to a GitHub Release
│   └── create-release.ps1    # pushes the Release itself through the API
├── CHANGELOG.md
├── README.md
└── README.zh-CN.md
```

## Art pipeline

Every character, enemy and decoration is built from named vector parts at runtime. To swap in your own drawing, drop a transparent PNG at `art/<folder>/<part>.png` — same name as the `.svg`, same box aspect ratio, pivot at the joint. [docs/ART_GUIDE.md](docs/ART_GUIDE.md) lists every part with its box size, pivot and a suggested pixel size; the original `.svg` files work as tracing templates.

Tiles and backgrounds are already PNGs: overwrite them directly (tiles are 64 × 64 seamless, backgrounds tile horizontally).

## Built with

- [Godot Engine 4.7](https://godotengine.org/) — Windows x64 export
- Vector art generated in code; sound effects and two music loops are still placeholders

## Roadmap

- [x] v0.1 — first playable demo
- [x] v0.4 — menus, saves, settings, camera zones
- [x] v0.10 — 37 rooms, false walls, the Garrison, challenge rooms
- [ ] Day 9 — reach 10× the original Fallen Gate (≈10× tile count)
- [ ] Nebula Gardens region (wall-jump / Comet Claws payoff)
- [ ] Orrery Works region (gravity flip payoff)
- [ ] Second boss
- [ ] Hand-drawn art replacing the vector parts (see the art guide)
- [ ] Real sound effects and music
- [ ] Code-signed Steam build

## Known issues

- Windows only for now — no macOS or Linux build.
- The executable is unsigned, so Windows SmartScreen warns on first run.
- Sound effects and music are still placeholders; the art is vector work in progress.
- The **Enemy Test Room** ships inside the menu for now and will be hidden before release.
- Settings and save slots are local to your machine — nothing syncs to the cloud.

## FAQ

<details>
<summary><strong>Why is the .exe split into twelve files?</strong></summary>

GitHub blocks files larger than 100 MB. The Godot export is about 105 MB, so it is stored as `data/GalaxyCastle.exe.001` … `.011` (≈10 MB each) and reassembled by `play.bat` on first launch. Each part stays well below the limit, and the repository remains cloneable with a normal `git clone`.

</details>

<details>
<summary><strong>Why isn't the executable in the repository?</strong></summary>

`GalaxyCastle.exe` is a generated artifact: it is byte-identical to the concatenation of the eleven parts. Committing it would double the repository size for no benefit, so it is listed in `.gitignore`. For a single-file download, use the zip from [Releases](../../releases).

</details>

<details>
<summary><strong>Where are my saves?</strong></summary>

`%APPDATA%\Godot\app_userdata\Galaxy Castle\saves\` — three slots, one folder each. Deleting that folder resets your progress.

</details>

<details>
<summary><strong>Will my old save keep working?</strong></summary>

v0.10 saves load with your stats and abilities intact, but you start again at the Fallen Gate because the rooms have moved. Same for v0.9 → v0.10.

</details>

<details>
<summary><strong>Can I use Git LFS instead of split parts?</strong></summary>

Yes. Git LFS keeps large binaries out of the normal Git history, at the cost of an extra install step for anyone cloning. See [docs/PUBLISHING.md](docs/PUBLISHING.md#working-with-large-binaries) for the trade-offs and the commands.

</details>

## Feedback

Bug reports, balance notes and "this camera feels wrong" feedback are all welcome — please open an [issue](../../issues). Source code is not public yet, so pull requests are not accepted for now.

## License

This demo is **not** released under an open-source license yet. Unless a `LICENSE` file is added, all rights are reserved by the author — the game, its code, art and audio included.
