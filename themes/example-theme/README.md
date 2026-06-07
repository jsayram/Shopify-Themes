# example-theme

This is a minimal example Shopify theme scaffold for this monorepo.

## Purpose

Use this directory as a reference for how independent themes should be organized. For real work, create a descriptive theme folder such as `themes/minimal-fashion/` or `themes/client-name-main/`.

## Shopify CLI

```bash
cd themes/example-theme
shopify theme dev
shopify theme push
```

## Notes

Keep Shopify CLI local config and store-specific data out of Git unless it is intentionally sanitized and reusable.
