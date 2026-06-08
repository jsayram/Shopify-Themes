#!/usr/bin/env sh
set -eu

theme_slug="${1:-gluteloom-current}"
store="${2:-gluteloom}"
port="${3:-}"
theme_dir="themes/$theme_slug"

if [ ! -d "$theme_dir" ]; then
  echo "Theme folder not found: $theme_dir"
  echo ""
  echo "Available themes:"
  find themes -mindepth 1 -maxdepth 1 -type d -print 2>/dev/null | sed 's#^themes/##'
  exit 1
fi

if ! command -v shopify >/dev/null 2>&1; then
  echo "Shopify CLI is not installed or is not on PATH."
  echo "Install it with: npm install -g @shopify/cli @shopify/theme"
  exit 1
fi

if command -v node >/dev/null 2>&1; then
  node_major="$(node -v | sed 's/^v//' | cut -d. -f1)"
  if [ "$node_major" -lt 22 ]; then
    echo "Warning: Shopify CLI may require a newer Node version than $(node -v)."
    echo "Try: nvm use 26"
    echo ""
  fi
fi

echo "Starting Shopify theme dev"
echo "Theme: $theme_dir"
echo "Store: $store"
echo "Editor sync: enabled"
echo ""

if [ -n "$port" ]; then
  exec shopify theme dev --store "$store" --path "$theme_dir" --theme-editor-sync --port "$port"
fi

exec shopify theme dev --store "$store" --path "$theme_dir" --theme-editor-sync
