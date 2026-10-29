# Changelog

All notable changes to the **Galaxy Castle** demo are documented in this file.

The format follows [Keep a Changelog](https://keepachangelog.com/en/1.1.0/), and
the project follows [Semantic Versioning](https://semver.org/) (`MAJOR.MINOR.PATCH`).

## [Unreleased]

### Planned

- Day 9 — reach ~45 rooms and 10× the original Fallen Gate tile count
- Nebula Gardens region (Comet Claws / wall-jump payoff)
- Orrery Works region (gravity flip payoff)
- Second boss
- Hand-drawn art replacing the vector parts (see [docs/ART_GUIDE.md](docs/ART_GUIDE.md))
- Real sound effects and music
- Code-signed build for Steam

## [0.10.0] — 2026-10-29

Third public build. The Fallen Gate reaches **37 rooms and 24,753 playable tiles — 8.1× the v0.5 size**.

### Added

- **Logical-structure rebuild.** Stairwells (Climbing Well, Barbican, Starfall Stair) are proper stair shafts: ledges anchored in walls, short platforms hanging on chains. No floating slabs, no step blocks under openings, no one-tile slots; the level generator now refuses all of them
- **False walls** — indistinguishable from stone; the tell is sound (stone *rings*, false stone *thuds*). Contents stay rock-textured until the wall breaks, then fade in. Hidden rooms stay off Orrin's map until found; sealed chambers are drawn as rock
- **False floor** in the Ossuary breaks under downward strikes
- **Varied secret rewards:** Star Relic (brass astrolabe), Comet Ore, Stardust hoard (+25), stone tablet (press Up to read), Heart Fragments, Constellation Shards; the HUD counts Relics and Ore
- **Day 8: the Garrison (rooms 26–37)** — the Drill Yard under the Broken Rampart; a lever drops the Garrison Gate's portcullis (shortcut to the Armory); the Sally Port loops back to the Starfall Stair; new Watch Post with a Starwell and the fourth Orbit Rail station
- **Two new enemies from data files:** the Husk Brute (bigger, slower, 7 health, hits for 2) and the Ember Wisp (faster, fragile, short warning)
- **Two optional challenge rooms**, Hollow-Knight-trial style: Thorn Gauntlet (50 tiles of spikes crossed on pillars and hanging platforms) and the Trial Arena (three waves; the vault holds Comet Ore, Stardust and a tablet)
- **Three hidden rooms:** the Quartermaster's strongbox (Star Relic), the prisoner's escape tunnel (Stardust hoard) and the Deserter's Hideout (Constellation Shard)

### Changed

- Saves from v0.9 keep their stats and abilities but start again at the Fallen Gate (the rooms have moved)

## [0.9.0] — internal

### Added

- **25 rooms instead of 12** (growth step 1 of 3 toward ~45): the north wing (Watch Gallery, two-storey Barbican Hall, Bell Tower, Rampart Walk, Watchtower Roof, Lookout Roof, Thorn Spire, Shrine Approach) and the south wing (Crypt Stair, Ossuary, Bone Gallery), plus two hidden rooms: the Sealed Reliquary (Heart Fragment) and the Sealed Catacomb (Constellation Shard)
- Playable area: 17,510 tiles, 5.7× v0.5
- **Ability order follows the design document (option A):** new games start with run, jump, glaive, parry, heal and downward bounce only; **Star Dash** is the Gatewarden's reward, **Comet Claws** (wall-jump) comes in Nebula Gardens, **Gravity Flip** in Orrery Works; the HUD lists the abilities you have
- **Stairwell climbing without wall-jump:** Climbing Well (now 60 tiles tall), Barbican Hall and Starfall Stair are hop-onto-step shafts
- **"Come back later" spots** confirmed by the level checker: Bell Tower chimney and Thorn Spire chimney (wall-jump), a Bone Gallery alcove (dash, Heart Fragment), Inverted Bridge ceiling (gravity flip, Heart Fragment + Stardust)
- **Cracked walls:** three glaive hits break one for good; broken walls stay broken in the save
- The Enemy Test Room is menu-only, fully unlocked, not a real level and will be hidden before release

### Changed

- The Gravity Core pickup is gone from the Fallen Gate (option A)
- Saves from v0.8 keep their stats but start again at the Fallen Gate and drop the old Gravity Core

## [0.8.0] — internal

### Added

- **Main menu → Enemy Test Room:** a separate, unsaved room for the two new Nebula Gardens enemies
  - **Spore Bloom** — rooted flower; near you it opens, glows (the warning), then puffs a fan of spores that burst into short poison clouds; cut the spores, parry them or dodge, then hit the bloom
  - **Vine Crawler** — one-eyed thorned vine that crawls floors, walls and ceilings and wraps around platforms; turns at spikes; never leaves its room
- Every enemy (Husk, Wisp included) is now defined in a small **data file** — health, damage, speed and drops tunable without code changes

## [0.7.0] — internal

### Added

- **Starwells are save points you use on purpose** (Hollow Knight benches / Blasphemous prie-dieus): touch to light; stand and press Up to **rest** — health refills, gravity resets, the game saves, it becomes your respawn point, and **every enemy you defeated since the last rest comes back**; defeated enemies stay down until you rest or die
- **Different rewards for exploring:** Stardust (small crystals), Stardust caches (large crystals, 5), **Heart Fragments** (pink hearts, hard spots — 4 add a health pip; two in the Fallen Gate: Collapsed Armory and under a Starfall Stair ledge, gravity flip), **Constellation Shard** (Climbing Well side room, raises max Starlight — 12 in the full game); the HUD shows Fragments x/4 and Shards next to Stardust

### Changed

- Husks no longer get stuck under low ledges; their lunges and your hits can no longer push them off a ledge or into spikes; one-tile floating-step gaps are now solid
- Signs no longer overlap the "Up: Rest" / "Up: Orbit Rail" prompts

## [0.6.0] — internal

### Added

- **The Fallen Gate is now 12 rooms** (it was 5), laid out as a climb through the castle: The Fallen Gate, Shattered Courtyard, The Climbing Well, Cartographer's Lookout, Hall of Thorns, Collapsed Armory (optional, through a floor hole), Broken Rampart, Gravity Shrine, The Inverted Bridge, Starfall Stair, Warden's Antechamber, Gatewarden's Hall. About 25–35 minutes on a first run
- **Compact rooms:** walls only one or two tiles thick; the map shows real room shapes instead of solid rock
- **Orrin the Cartographer** in the Cartographer's Lookout: press Up next to him to buy the **Map of The Fallen Gate for 30 Stardust**
- **Silksong-style map:** before buying, the map screen is empty; Orrin's map shows a rough sketch of every room in the region, and the places you have actually walked through are drawn in detail (true walls, platforms, spikes) with Starwells, Orbit Rail stations and the Guardian
- **New challenges:** a wall-jump well with a side room, stairs of floating ledges, a pillar over a spike pit, and the **Starfall Stair** (flip gravity, walk the ceiling over hanging spikes, flip back onto a high ledge); Stardust caches reward exploring

### Changed

- Saves from v0.5 load (Stardust, health and abilities kept) but start again at the Fallen Gate

## [0.5.0] — internal

### Added

- **Map (Tab / M, gamepad Back):** fills in as you explore — only the parts of each room you have actually passed through are drawn; shows Lune's position and facing, Starwells, Orbit Rail stations, the Guardian and exploration percentage; the game pauses while open
- **Map pins:** arrow keys move the cursor, Enter places/removes a pin, F switches type (Star, Danger, Treasure, Question), L zooms; pins are saved
- **Orbit Rail stations (fast travel):** touch to attune; stand and press Up to ride to any other attuned station — three in v0.5: The Fallen Gate, Broken Rampart and the Starwell before the Gatewarden's arena (a fourth joins in v0.10)

### Changed

- Restart from the last Starwell is now `R` only; the gamepad Back button opens the map

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

[Unreleased]: https://github.com/hanghangworker-ui/Galaxy-Castle/compare/v0.10.0...HEAD
[0.10.0]: https://github.com/hanghangworker-ui/Galaxy-Castle/releases/tag/v0.10.0
[0.4.0]: https://github.com/hanghangworker-ui/Galaxy-Castle/releases/tag/v0.4.0
[0.1.0]: https://github.com/hanghangworker-ui/Galaxy-Castle/releases/tag/v0.1.0
