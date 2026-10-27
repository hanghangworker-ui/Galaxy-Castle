# Galaxy Castle — Art guide for drawn replacements

Every character, enemy, decoration and effect is built from the parts below. To replace a part with your
own drawing, save a **PNG with a transparent background** at `art/<folder>/<part>.png` (same name as the
`.svg`). The game stretches the PNG over the part's box, so keep the box's **aspect ratio**. The *pivot* is
the joint the part rotates around (for example the shoulder of an upper arm); draw the part so the joint
sits at that point of the box.

Suggested size is 8 pixels per game unit (Lune is about 66 units tall, so about 528 px).
Parts face **right**. Back-side limbs reuse the same drawing, darkened by the game.

The original `.svg` files open in any vector editor (Inkscape, Illustrator, Affinity) and can be used as
tracing templates.

## decor

| Part | Box (units, w × h) | Pivot inside the box (from left, from top) | Suggested PNG |
| --- | --- | --- | --- |
| `decor/banner` | 24 × 74 | 50% , 3% | 192 × 592 px |
| `decor/candelabra` | 24 × 43 | 50% , 98% | 192 × 344 px |
| `decor/chain` | 6 × 96 | 50% , -0% | 48 × 768 px |
| `decor/crystal` | 30 × 27 | 50% , 96% | 240 × 216 px |
| `decor/flowers` | 24 × 10.5 | 50% , 95% | 192 × 84 px |
| `decor/pillar` | 44 × 260 | 50% , 100% | 352 × 2080 px |
| `decor/spikes` | 32 × 18 | -0% , 100% | 256 × 144 px |
| `decor/statue` | 40 × 73 | 50% , 99% | 320 × 584 px |
| `decor/window` | 60 × 92 | 50% , 100% | 480 × 736 px |

## fx

| Part | Box (units, w × h) | Pivot inside the box (from left, from top) | Suggested PNG |
| --- | --- | --- | --- |
| `fx/glow` | 64 × 64 | 50% , 50% | 512 × 512 px |
| `fx/ring` | 64 × 64 | 50% , 50% | 512 × 512 px |
| `fx/slash` | 80 × 80 | 50% , 50% | 640 × 640 px |
| `fx/spark` | 16 × 16 | 50% , 50% | 128 × 128 px |

## gatewarden

Skeleton: hips (52 above feet) → torso → helm (+visor), cape, pauldrons, arms (upper → fore → halberd); hips → thighs → shins.

| Part | Box (units, w × h) | Pivot inside the box (from left, from top) | Suggested PNG |
| --- | --- | --- | --- |
| `gatewarden/arm_fore` | 14 × 27 | 50% , 7% | 112 × 216 px |
| `gatewarden/arm_upper` | 12 × 24 | 50% , 8% | 96 × 192 px |
| `gatewarden/cape` | 46 × 70 | 87% , 6% | 368 × 560 px |
| `gatewarden/halberd` | 62 × 178 | 35% , 75% | 496 × 1424 px |
| `gatewarden/helm` | 28 × 47 | 50% , 96% | 224 × 376 px |
| `gatewarden/pauldron` | 28 × 22 | 50% , 45% | 224 × 176 px |
| `gatewarden/shin` | 23 × 30 | 35% , 7% | 184 × 240 px |
| `gatewarden/thigh` | 16 × 29 | 50% , 7% | 128 × 232 px |
| `gatewarden/torso` | 50 × 60 | 50% , 80% | 400 × 480 px |
| `gatewarden/visor` | 15 × 7 | 13% , 343% | 120 × 56 px |

## husk

Skeleton: hips (14 above feet) → body → head, arms; hips → legs.

| Part | Box (units, w × h) | Pivot inside the box (from left, from top) | Suggested PNG |
| --- | --- | --- | --- |
| `husk/arm` | 9.5 × 25 | 37% , 8% | 76 × 200 px |
| `husk/body` | 28 × 35 | 50% , 74% | 224 × 280 px |
| `husk/head` | 20 × 15.5 | 45% , 84% | 160 × 124 px |
| `husk/leg` | 8 × 15.5 | 38% , 6% | 64 × 124 px |

## lune

Skeleton: hips (25 above feet) → torso → head (+hair), cape, arms (upper → fore → glaive); hips → thighs → shins.

| Part | Box (units, w × h) | Pivot inside the box (from left, from top) | Suggested PNG |
| --- | --- | --- | --- |
| `lune/arm_fore` | 6 × 11.8 | 50% , 8% | 48 × 94 px |
| `lune/arm_upper` | 7.2 × 11.6 | 50% , 22% | 57 × 92 px |
| `lune/cape` | 26 × 41 | 81% , 7% | 208 × 328 px |
| `lune/glaive` | 17 × 72 | 24% , 71% | 136 × 576 px |
| `lune/hair_back` | 19 × 39 | 74% , 28% | 152 × 312 px |
| `lune/head` | 26 × 29 | 46% , 90% | 208 × 232 px |
| `lune/shin` | 11.5 × 15.5 | 35% , 10% | 92 × 124 px |
| `lune/thigh` | 8 × 15 | 50% , 10% | 64 × 120 px |
| `lune/torso` | 18 × 25 | 50% , 72% | 144 × 200 px |

## wisp

| Part | Box (units, w × h) | Pivot inside the box (from left, from top) | Suggested PNG |
| --- | --- | --- | --- |
| `wisp/core` | 26 × 26 | 50% , 50% | 208 × 208 px |
| `wisp/tail` | 25 × 14 | 96% , 50% | 200 × 112 px |

## Not replaceable this way

Tiles (`art/tiles/*.png`) and backgrounds (`art/bg/*.png`) are already PNGs: overwrite them directly,
keeping the same size (tiles are 64 × 64 seamless, backgrounds tile horizontally).
