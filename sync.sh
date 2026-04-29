#!/bin/bash
# Syncs posts from Obsidian vault into Hugo content dir
rsync -av --delete \
  --exclude='.obsidian' \
  --exclude='.trash' \
  --exclude='Templates' \
  /Users/salwynmathew/Documents/Salwyn/blog/ \
  /Users/salwynmathew/Code/my-blog/content/
