# Theme Structure

This repo stores full Shopify themes in `themes/<theme-slug>/`.

## Naming

Use lowercase kebab-case names that describe the theme or store use case:

```text
themes/minimal-fashion/
themes/home-goods-v2/
themes/client-name-main/
```

Avoid generic names like `theme-1` or `theme-2`.

## Expected Theme Layout

Each theme should follow Shopify's standard theme directory layout:

```text
themes/<theme-slug>/
  assets/
  blocks/
  config/
  layout/
  locales/
  sections/
  snippets/
  templates/
  README.md
```

Run Shopify CLI commands from inside the theme directory:

```bash
cd themes/<theme-slug>
shopify theme dev
shopify theme push
```

## Git Policy

Track reusable theme source:

- Liquid files in `layout/`, `sections/`, `snippets/`, and `blocks/`
- JSON templates in `templates/`
- Theme assets in `assets/`
- Locale files in `locales/`
- Reusable schema in `config/settings_schema.json`

Do not track local Shopify CLI state, local environment files, dependencies, build caches, or editor-specific files.

Treat `config/settings_data.json` as store data. Commit it only if it contains clean defaults that are safe to reuse.
