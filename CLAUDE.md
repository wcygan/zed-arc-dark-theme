# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This repository creates a Zed editor theme based on Arc Dark, adapting the IntelliJ Arc Dark Theme for Zed. The project uses two reference implementations:

1. **Arc Dark IntelliJ Theme** (`references/arc-theme-idea-master/`) - source color palette and design
2. **Zedokai Theme** (`references/zedokai-main/`) - reference Zed theme structure and implementation patterns

## Key Color Palette (from Arc Dark)

Core colors from the IntelliJ Arc Dark theme:
- Background: `#383c4a` (main), `#404651` (secondary), `#474c5b` (tertiary)
- Borders: `#2b2e39`
- Accent/Focus: `#2679db` (primary blue), `#1e61b0` (inactive selection)
- Text: `#d3dae3` (primary), `#9ba2ab` (muted/disabled)
- Hover states: `#505666`, `#4e5467`

## Theme Development

### Zed Theme Schema

The theme must conform to Zed's theme schema v0.2.0 (documented in ZED-THEMES.md). Key structure:

```json
{
  "author": "string",
  "name": "string",
  "themes": [
    {
      "name": "Theme Name",
      "appearance": "dark" | "light",
      "style": { /* theme properties */ }
    }
  ]
}
```

### Critical Theme Properties

When creating themes, focus on these essential style properties:
- `background`, `editor.background` - main editor colors
- `border`, `border.variant`, `border.focused` - UI borders
- `text`, `text.muted`, `text.accent` - text colors
- `element.background`, `element.hover`, `element.active` - interactive elements
- `syntax` - code highlighting (most detailed section)

### References

Official Zed theme documentation:
- https://zed.dev/docs/themes
- https://zed.dev/docs/extensions/themes
- https://zed.dev/blog/user-themes-now-in-preview
- Schema: https://zed.dev/schema/themes/v0.2.0.json

### Theme Installation & Testing

**User Theme Location**: Place theme JSON files in `~/.config/zed/themes/`

**Auto-loading**: Themes automatically appear in Zed's theme selector when Zed loads. After adding or modifying a theme file, restart Zed to see changes.

### Development Workflow

1. Reference Arc Dark IntelliJ theme (`references/arc-theme-idea-master/arc-theme-idea-dark/resources/arc_theme_dark.theme.json`) for color values
2. Use Zedokai structure (`references/zedokai-main/themes/zedokai.json`) as template for property mapping
3. Map IntelliJ UI properties to Zed theme schema properties
4. Place theme JSON in `~/.config/zed/themes/` directory
5. Restart Zed to load the theme
6. Select theme from theme selector to test

### Rapid Iteration with Theme Overrides

For quick experimentation without modifying theme files, use `experimental.theme_overrides` in Zed settings:

```json
{
  "theme": "Arc Dark",
  "experimental.theme_overrides": {
    "editor.background": "#383c4a",
    "border": "#2b2e39"
  }
}
```

These overrides:
- Apply globally across all themes
- Support live-reloading (no Zed restart needed)
- Useful for testing specific color values before committing to theme file

### Creating Theme Extensions

For distributing themes as extensions:

1. Create `themes/` directory in extension root
2. Add theme JSON files (must conform to schema)
3. Include `extension.toml` with metadata:
   ```toml
   id = "arc-dark-theme"
   name = "Arc Dark Theme"
   version = "1.0.0"
   schema_version = 1
   authors = ["Your Name"]
   repository = "https://github.com/..."
   description = "Arc Dark theme for Zed"
   ```

### VS Code Theme Importer

Convert existing VS Code themes using Zed's theme importer (requires Zed source):

```bash
cargo run -p theme_importer -- path/to/vscode-theme.json
```

Note: Output may require manual refinement for optimal results.

## Publishing as Zed Extension

### Extension Requirements

**Required files:**
- `extension.toml` - Extension metadata manifest (required)
- `themes/` directory - Contains theme JSON files
- `LICENSE` or `LICENCE` - One of: Apache 2.0, BSD 3-Clause, GNU GPLv3, or MIT

**Note**: Theme-only extensions don't require Rust/WebAssembly code. Only extensions with custom functionality (languages, debuggers, slash commands, etc.) need `Cargo.toml` and `src/lib.rs`.

### extension.toml Format

```toml
id = "arc-dark-theme"
name = "Arc Dark Theme"
version = "1.0.0"
schema_version = 1
authors = ["Your Name <email@example.com>"]
description = "Arc Dark theme for Zed based on the popular Arc Dark color scheme"
repository = "https://github.com/username/zed-arc-dark-theme"
```

**Important fields:**
- `id`: Unique identifier (lowercase, hyphens only)
- `version`: Semantic versioning (update this for new releases)
- `schema_version`: Always `1` for current extensions
- `repository`: Must be HTTPS URL to public Git repository

### Publishing Process

1. **Add LICENSE file** to repository root (required as of Oct 2025)
2. **Fork** `zed-industries/extensions` repository
3. **Add as submodule** using HTTPS URL:
   ```bash
   cd extensions
   git submodule add https://github.com/username/zed-arc-dark-theme extensions/arc-dark-theme
   ```
4. **Add entry** to `extensions.toml`:
   ```toml
   [arc-dark-theme]
   version = "1.0.0"
   ```
5. **Run sort command**: `pnpm sort-extensions`
6. **Create PR** to `zed-industries/extensions`

### Updating Published Extension

1. Update `version` in `extension.toml`
2. Commit and push changes to your repository
3. Update submodule reference in `zed-industries/extensions`
4. Update version in `extensions.toml`
5. Create PR

## File Structure

- `ZED-THEMES.md` - Complete Zed theme schema and documentation
- `references/arc-theme-idea-master/` - Arc Dark IntelliJ theme source
- `references/zedokai-main/` - Zedokai reference implementation
  - `extension.toml` - Extension metadata structure
  - `themes/zedokai.json` - Theme JSON structure

## Notes

- Theme JSON files can be large (30k+ tokens) due to extensive syntax highlighting definitions
- IntelliJ themes use different property names than Zed; careful mapping required
- Zed themes support multiple variants in single file (see Zedokai filters)
