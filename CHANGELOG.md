# Changelog

All notable changes to the **Galaxy Castle** demo are documented in this file.

The format follows [Keep a Changelog](https://keepachangelog.com/en/1.1.0/), and
the project follows [Semantic Versioning](https://semver.org/) (`MAJOR.MINOR.PATCH`).

## [Unreleased]

### Planned

- Hand-drawn art replacing the vector parts (see [docs/ART_GUIDE.md](docs/ART_GUIDE.md))
- Real sound effects and music
- More rooms and a second boss
- Code-signed build for Steam

## [0.4.0] — 2026-10-27

Second public build. This is the version with a proper front end.

### Added

- **Main menu** — Continue, New Game, Load Game, Settings, Quit; works with keyboard, gamepad and mouse
- **Three save slots** — each shows its room, play time and Stardust; saves at every Starwell, on death, after the boss and on *Save and quit*; slots can be deleted
- **Settings screen** — master / music / effects volume, fullscreen, screen shake, and key rebinding with a reset to defaults
- **Pause menu** — Resume, Settings, Controls guide, Restart from last Starwell, Save and quit to title
- **Camera zones** — corridors hold the camera height, the wall-jump shaft holds its column, open areas follow Lune (height only changes on landing), and the Gatewarden's hall is a fixed, zoomed-out arena view

### Changed

- **Lune's face** redrawn in a three-quarter view (near eye by the ear, far eye past the nose bridge)

## [0.3.0] — internal

### Added

- The Fallen Gate split into **five connected rooms**: The Fallen Gate, Hall of Thorns, Broken Rampart, The Inverted Bridge, Gatewarden's Hall
- Fade transition when walking off the edge of a room; each room introduces itself by name

### Changed

- Enemies return when you re-enter a room; collected Stardust stays collected

## [0.2.0] — internal

### Added

- **Lune** redrawn as a detailed anime-style character (silver hair, constellation cape, gold armour, crescent glaive) with 15 animations
- **Husk, Wisp and the Gatewarden** rebuilt as animated models; the Gatewarden got wind-ups, slams, charges, leaps, Star Rain and a red-eyed phase 2
- **Level art:** textured stone, frost/moss ledges, crystal spikes, painted parallax backgrounds, stained-glass windows, pillars, banners, chains, candles, statues, glowing flowers and crystals, drifting dust, vignette
- **Effects:** glowing slash trails, hit sparks, parry rings, dust puffs, heal bursts

### Changed

- Slight hang time at the top of a jump and a snappier fall; closer camera
- Keyboard bindings can be saved and reloaded

## [0.1.0] — 2026-10-26

First public playable demo: **“The Fallen Gate”**.

### Added

- **Lune** — run, jump (variable height), wall-jump, invincible dash
- 3-hit glaive combo, up/down attacks, down-attack bounce, parry, hold-to-heal with Starlight
- **Gravity Core** — flip gravity and walk on the ceiling
- Enemies: Husk (patrol + claw lunge) and Wisp (flying charge)
- Boss: **The Gatewarden** — slam, charge and leap shockwaves; phase 2 adds Star Rain
- Starwell checkpoints, Stardust pickups, and Echo (recovers your Stardust after death)
- Two music loops, placeholder SFX, gamepad rumble, keyboard and Xbox-layout gamepad support
- `play.bat` launcher that reassembles the split executable on first run

[Unreleased]: https://github.com/hanghangworker-ui/Galaxy-Castle/compare/v0.4.0...HEAD
[0.4.0]: https://github.com/hanghangworker-ui/Galaxy-Castle/releases/tag/v0.4.0
[0.1.0]: https://github.com/hanghangworker-ui/Galaxy-Castle/releases/tag/v0.1.0
