# Shopify Themes

This repository is the main workspace for Shopify themes. Each full theme lives under `themes/<theme-slug>/`, and shared notes or helper scripts live at the repo root.

## Daily Workflow

For the GluteLoom theme, start here from the repo root:

```bash
nvm use 26
sh scripts/dev-theme.sh
```

That helper runs:

```bash
shopify theme dev --store gluteloom --path themes/gluteloom-current --theme-editor-sync
```

Use the printed local preview URL for storefront testing and the printed editor URL for Shopify Theme Editor changes.

If port `9292` is busy, pass a port:

```bash
sh scripts/dev-theme.sh gluteloom-current gluteloom 9293
```

## What To Edit Where

Edit code in VS Code when changing:

- CSS and global styling: `themes/<theme>/assets/*.css`
- JavaScript behavior: `themes/<theme>/assets/*.js`
- Product/page structure logic: `themes/<theme>/sections/*.liquid`
- Reusable snippets: `themes/<theme>/snippets/*.liquid`
- JSON templates: `themes/<theme>/templates/*.json`

Use Shopify Theme Editor when changing:

- Section order
- Section/block text
- Theme colors and typography settings
- Product template assignment
- Images selected through theme settings

When running with `--theme-editor-sync`, supported Theme Editor changes sync back into the local theme files.

## Product Templates

Product page layouts are stored in `themes/<theme>/templates/`.

Current GluteLoom examples:

```text
themes/gluteloom-current/templates/product.json
themes/gluteloom-current/templates/product.general_template.json
themes/gluteloom-current/templates/product.autods_6a20bc552c8456b012870b25.json
themes/gluteloom-current/templates/product.gluteloom-standard.json
```

Use `product.gluteloom-standard.json` as the cleaner standard product layout. Preview it by adding the view suffix:

```text
http://127.0.0.1:9292/products/product-handle?view=gluteloom-standard
```

To make a product use it permanently:

```text
Shopify Admin > Products > select product > Theme template > gluteloom-standard
```

## Theme Editor Conflicts

If Shopify CLI asks:

```text
Reconciliation Strategy:
  Keep the remote version
> Keep the local version
```

Use this rule:

- Choose `Keep the local version` when you want your VS Code files to win.
- Choose `Keep the remote version` when you made changes in Shopify Theme Editor and want to pull those into your repo.

For the files Codex edits locally, usually choose `Keep the local version`.

## Pull, Preview, Push

Pull a store theme into a folder:

```bash
shopify theme pull --store gluteloom --theme THEME_ID --path themes/theme-slug
```

Preview a theme locally:

```bash
shopify theme dev --store gluteloom --path themes/theme-slug --theme-editor-sync
```

Push to an unpublished or specific theme:

```bash
shopify theme push --store gluteloom --theme THEME_ID --path themes/theme-slug
```

Do not push to the live theme until the preview has been checked.

## Repo Structure

```text
.
├── .github/
│   └── workflows/
├── docs/
├── scripts/
│   ├── dev-theme.sh
│   └── new-theme.sh
└── themes/
    ├── gluteloom-current/
    └── example-theme/
```

Use descriptive kebab-case theme names:

```text
themes/gluteloom-current/
themes/minimal-fashion/
themes/home-goods-v2/
```

Avoid names like `theme-1` or `theme-2`.

## Creating A New Theme Folder

From the repo root:

```bash
sh scripts/new-theme.sh my-theme-name
```

Then pull or copy a real Shopify theme into that folder before development.

## Git Safety

Track source files:

- `assets/`
- `blocks/`
- `config/settings_schema.json`
- `layout/`
- `locales/`
- `sections/`
- `snippets/`
- `templates/`

Be careful with:

- `config/settings_data.json`

That file can contain store-specific theme settings and merchant content. Commit it only when it is clean enough to keep in the repo.

Do not track:

- `.shopify/`
- `.theme-check/`
- `shopify.theme.toml`
- `.env`
- `node_modules/`
- logs, caches, and editor files

## Node And Shopify CLI

Use Node 26 for the current Shopify CLI install:

```bash
nvm use 26
node -v
shopify version
```

If you see an error about `enableCompileCache`, your terminal is probably using an older Node version. Run:

```bash
nvm use 26
```
