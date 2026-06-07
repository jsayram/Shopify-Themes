#!/usr/bin/env sh
set -eu

theme_name="${1:-}"

if [ -z "$theme_name" ]; then
  echo "Usage: sh scripts/new-theme.sh <theme-slug>"
  echo "Example: sh scripts/new-theme.sh minimal-fashion"
  exit 1
fi

case "$theme_name" in
  *[!a-z0-9-]* | -* | *-)
    echo "Theme slug must use lowercase kebab-case, for example: minimal-fashion"
    exit 1
    ;;
esac

theme_dir="themes/$theme_name"

if [ -e "$theme_dir" ]; then
  echo "Theme already exists: $theme_dir"
  exit 1
fi

mkdir -p \
  "$theme_dir/assets" \
  "$theme_dir/blocks" \
  "$theme_dir/config" \
  "$theme_dir/layout" \
  "$theme_dir/locales" \
  "$theme_dir/sections" \
  "$theme_dir/snippets" \
  "$theme_dir/templates"

cat > "$theme_dir/README.md" <<README
# $theme_name

## Purpose

Describe the store, client, or reusable theme purpose here.

## Shopify CLI

\`\`\`bash
cd $theme_dir
shopify theme dev
shopify theme push
\`\`\`

## Notes

Document store-specific setup, dependencies, or deployment details here.
README

touch \
  "$theme_dir/assets/.gitkeep" \
  "$theme_dir/blocks/.gitkeep" \
  "$theme_dir/config/.gitkeep" \
  "$theme_dir/layout/.gitkeep" \
  "$theme_dir/locales/.gitkeep" \
  "$theme_dir/sections/.gitkeep" \
  "$theme_dir/snippets/.gitkeep" \
  "$theme_dir/templates/.gitkeep"

echo "Created $theme_dir"
