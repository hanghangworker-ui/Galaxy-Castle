# Screenshots

Gameplay captures for the README live here.

## Adding a screenshot

1. Take a capture in game (`F11` for fullscreen first) and crop it to **1280×720** (16:9).
2. Save it as a PNG, lowercase with hyphens: `01-gameplay.png`, `02-gatewarden.png`, …
3. Keep each file under ~500 KB — run it through [Squoosh](https://squoosh.app/) or
   `pngquant --quality=65-85` if it is bigger.
4. Reference it from the root `README.md`:

   ```markdown
   | The Fallen Gate | The Gatewarden |
   | :---: | :---: |
   | ![Gameplay](docs/screenshots/01-gameplay.png) | ![Boss](docs/screenshots/02-gatewarden.png) |
   ```

   The placeholder comment in `README.md` already contains this table — just replace it.

## Tips

- Three to five images is plenty: one wide shot of the level, one combat moment,
  one of the gravity flip, one of the boss.
- Avoid shots with the Windows taskbar or mouse cursor in them.
- GIFs also work, but keep them under 10 MB or GitHub will be slow to load the page.
