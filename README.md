# Shopify Themes

This repository is a monorepo for independent Shopify themes.

## Overview

Each theme lives under `themes/<theme-slug>/` and should be a complete Shopify theme that can be previewed or pushed from inside that directory.

Use descriptive kebab-case theme names:

```text
themes/minimal-fashion/
themes/home-goods-v2/
themes/client-name-main/
```

Avoid generic names like `theme-1` or `theme-2`; they become difficult to manage as the repo grows.

## Repository Structure

```text
.
├── .github/
│   └── workflows/
├── docs/
├── scripts/
└── themes/
    └── example-theme/
        ├── assets/
        ├── blocks/
        ├── config/
        ├── layout/
        ├── locales/
        ├── sections/
        ├── snippets/
        ├── templates/
        └── README.md
```

- `.github/` is for repo-wide GitHub Actions and automation.
- `docs/` is for repo-wide conventions and setup notes.
- `scripts/` is for shared helper scripts.
- `themes/` is the only place full Shopify themes should live.

## Quickstart

Create a new theme scaffold:

```bash
sh scripts/new-theme.sh my-theme-name
```

Preview a theme locally with the Shopify CLI:

```bash
cd themes/example-theme
shopify theme dev
```

Deploy a theme with the Shopify CLI:

```bash
cd themes/example-theme
shopify theme push
```

Shopify CLI local files, local environment files, dependencies, build output, and editor noise are ignored by Git.

## Theme Settings

Commit reusable theme source files such as Liquid templates, sections, snippets, assets, locales, and `config/settings_schema.json`.

Treat `config/settings_data.json` carefully. Commit it only when it contains clean default settings for a reusable theme. If it contains real merchant/store content, sanitize it before committing or add a theme-specific ignore rule.

## Contributing

Contributions are welcome. Open an issue to discuss changes, then submit a PR.

## License

If this repository should include a license, add a `LICENSE` file or update this section accordingly.
