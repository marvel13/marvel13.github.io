# Obsidian + Hugo Blog Setup

## Overview

This is a personal blog built with Hugo, where Obsidian serves as the writing/editing environment. Posts are written in Obsidian and Hugo reads them directly from the Obsidian vault.

## Key Paths

| Purpose | Path |
|---|---|
| Hugo project root | `/Users/salwynmathew/Code/my-blog/` |
| Hugo config | `/Users/salwynmathew/Code/my-blog/hugo.toml` |
| Content (Obsidian vault subfolder) | `/Users/salwynmathew/Documents/Salwyn/blog/` |
| Blog posts | `/Users/salwynmathew/Documents/Salwyn/blog/blog/` |
| Themes | `/Users/salwynmathew/Code/my-blog/themes/hugo-bearblog/` |
| Static assets | `/Users/salwynmathew/Code/my-blog/static/` |
| Obsidian vault root | `/Users/salwynmathew/Documents/Salwyn/` |

## Hugo Configuration

- **Hugo version:** v0.160.1 (extended+withdeploy), installed via Homebrew
- **Theme:** `hugo-bearblog`
- **`baseURL`:** `https://example.com` (placeholder — not yet deployed)
- **`contentDir`:** points directly into the Obsidian vault at `Documents/Salwyn/blog`
- **`ignoreFiles`:** `.obsidian`, `.trash`, `Templates` — Obsidian internals are excluded from Hugo builds

## Post Frontmatter Format

Posts use YAML frontmatter. Example:

```yaml
---
title: "My Post Title"
date: "2026-04-27"
description: ""
tags: []
draft: true
---
```

- Posts start as `draft: true`; set to `false` (or remove the field) to publish
- Tags are a YAML list

## Workflow

1. Write or edit posts in Obsidian under `Documents/Salwyn/blog/blog/`
2. Run `hugo server` from `/Users/salwynmathew/Code/my-blog/` to preview locally
3. Run `hugo` to build into the `public/` directory
4. `baseURL` needs to be updated before deploying to a real host

## Obsidian Vault Structure (relevant parts)

```
Documents/Salwyn/
├── blog/               ← Hugo contentDir
│   ├── _index.md       ← Homepage content
│   ├── bear.md
│   ├── hugo.md
│   └── blog/           ← Blog posts live here
│       ├── _index.md
│       └── *.md
├── 001 Databases 📃/
├── Clippings/
├── raw/
├── Templates/          ← Ignored by Hugo
└── wiki/
```

## Common Commands

```bash
# Preview locally (run from Hugo project root)
cd /Users/salwynmathew/Code/my-blog && hugo server

# Build site
cd /Users/salwynmathew/Code/my-blog && hugo

# Preview including draft posts
cd /Users/salwynmathew/Code/my-blog && hugo server -D
```
