# Obsidian + Hugo Blog Setup

## Overview

Personal blog built with Hugo (hugo-bearblog theme). Posts are written in Obsidian and synced into the Hugo repo via a script before publishing. Deployed to GitHub Pages via GitHub Actions.

## Key Paths

| Purpose | Path |
|---|---|
| Hugo project root | `/Users/salwynmathew/Code/my-blog/` |
| Hugo config | `/Users/salwynmathew/Code/my-blog/hugo.toml` |
| Hugo content dir (committed) | `/Users/salwynmathew/Code/my-blog/content/` |
| Blog posts (Hugo) | `/Users/salwynmathew/Code/my-blog/content/blog/` |
| Obsidian vault root | `/Users/salwynmathew/Documents/Salwyn/` |
| Obsidian blog source | `/Users/salwynmathew/Documents/Salwyn/blog/` |
| Blog posts (Obsidian) | `/Users/salwynmathew/Documents/Salwyn/blog/blog/` |
| Static assets (images etc.) | `/Users/salwynmathew/Code/my-blog/static/images/` |
| Sync script | `/Users/salwynmathew/Code/my-blog/sync.sh` |
| GitHub Actions workflow | `/Users/salwynmathew/Code/my-blog/.github/workflows/hugo.yml` |

## Hugo Configuration

- **Hugo version:** v0.160.1 (extended+withdeploy), installed via Homebrew
- **Theme:** `hugo-bearblog`
- **`baseURL`:** `https://marvel13.github.io/`
- **`contentDir`:** `content` (relative — committed to the repo)
- **`timeZone`:** `Asia/Kolkata` (IST) — prevents today-dated posts from being treated as future
- **`ignoreFiles`:** `.obsidian`, `.trash`, `Templates`
- **`hideMadeWithLine`:** `true` — footer attribution removed

## Deployment

- **GitHub repo:** `https://github.com/marvel13/marvel13.github.io`
- **Live site:** `https://marvel13.github.io/`
- **Deploy method:** GitHub Actions — auto-deploys on every push to `master`
- **Pages source:** set to GitHub Actions (not legacy branch mode)
- Blog post URLs follow the pattern `https://marvel13.github.io/<slug>/`

## Publish Workflow

1. Write post in Obsidian under `Documents/Salwyn/blog/blog/`
2. Set `draft: false` in the frontmatter when ready to publish
3. For images: copy to `static/images/` with no spaces in the filename, use standard Markdown syntax `![alt](/images/filename.png)` — Obsidian's `![[...]]` syntax does NOT work in Hugo
4. Run sync script to copy content into the repo:
   ```bash
   cd /Users/salwynmathew/Code/my-blog && ./sync.sh
   ```
5. Commit and push:
   ```bash
   git add . && git commit -m "Add post: <title>" && git push
   ```
6. GitHub Actions builds and deploys automatically (~1 min)

## Post Frontmatter Format

```yaml
---
title: "My Post Title"
date: "2026-04-30"
description: ""
tags: []
draft: false
---
```

- `draft: true` = visible locally with `hugo server -D`, hidden in production
- `draft: false` = published
- Dates must be in your local timezone (IST) — Hugo is configured for `Asia/Kolkata`
- Do NOT use spaces in filenames — use hyphens (e.g. `my-post.md`, `my-image.png`)

## Common Commands

```bash
# Preview locally including drafts
cd /Users/salwynmathew/Code/my-blog && hugo server -D

# Sync Obsidian content into Hugo repo
cd /Users/salwynmathew/Code/my-blog && ./sync.sh

# Build site locally
cd /Users/salwynmathew/Code/my-blog && hugo
```

## Known Quirks

- **Spaces in filenames break Markdown image rendering** — always rename images before copying to `static/images/`
- **Obsidian `![[image]]` syntax is not supported** — use `![alt](/images/filename.png)`
- **Duplicate content dir bug** — `content/` inside the Hugo project takes precedence over `contentDir` in config. Do not create a `content/` dir if using an external `contentDir`, or vice versa.
- **IST timezone** — without `timeZone = "Asia/Kolkata"` in hugo.toml, posts dated today are treated as future and excluded from builds
