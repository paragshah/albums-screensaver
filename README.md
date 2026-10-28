# Album Cover Screensaver

A macOS-style album cover screensaver built as a single-page web application. The screen fills with a grid of album covers that flip with a 3D animation, mimicking the iconic macOS screensaver effect. Covers can be sourced from iTunes Top 100 RSS feeds or from local genre collections.

## Features

- Responsive grid that scales to fill the viewport on any screen size
- Perfectly square album covers with even clipping on all edges
- 3D horizontal flip animation; the same cell never flips twice in a row
- No duplicate covers displayed at the same time
- Remote images upscaled to 600×600 for crisp rendering
- Vanilla JavaScript and CSS only — no frameworks or dependencies

## Settings

Press `?` to open the settings modal, `Esc` to close. Settings are persisted in localStorage.

- **Feed** — Apple Top Albums, Apple Top Songs, or any local genre category
- **Flip interval** — delay between flips from 1 to 10 seconds (default: 3s)

## Data Sources

### Remote Feeds

- [iTunes Top 100 Albums](https://itunes.apple.com/us/rss/topalbums/limit=100/json)
- [iTunes Top 100 Songs](https://itunes.apple.com/us/rss/topsongs/limit=100/json)

### Local Genre Collections

Album covers can also be served from the `covers/` directory, organized by genre. A manifest file (`covers/manifest.json`) maps genre names to their image files and is loaded on startup. Any genres found are added to the feed dropdown automatically.

To add a new genre, create a subdirectory under `covers/` with album art (JPG, PNG, GIF, or WebP), then regenerate the manifest:

```sh
bash scripts/generate-manifest.sh
```

The manifest script scans all subdirectories under `covers/` and writes `covers/manifest.json`.
