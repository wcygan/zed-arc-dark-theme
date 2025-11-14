# Arc Dark Theme for Zed

A dark theme for [Zed](https://zed.dev) based on the popular [Arc Dark](https://github.com/horst3180/arc-theme) color scheme, adapted from the [IntelliJ Arc Dark Theme](https://gitlab.com/zlamalp/arc-theme-idea) by Pavel Zlámal.

## Features

- Signature Arc Dark blue accent (`#2679db`)
- Carefully mapped UI colors from the original Arc Dark theme
- Complete syntax highlighting for all major languages
- Terminal ANSI color support
- Git status colors for created/modified/deleted files
- 8 player colors for collaborative editing

## Installation

### Quick Install (Recommended)

Run the installation script:

```bash
./install.sh
```

### Manual Installation

1. Copy `arc-dark.json` to your Zed themes directory:

```bash
mkdir -p ~/.config/zed/themes
cp arc-dark.json ~/.config/zed/themes/
```

2. Restart Zed

3. Open Zed settings (Cmd+, on macOS, Ctrl+, on Linux)

4. Select "Arc Dark" from the theme selector, or add to your settings:

```json
{
  "theme": "Arc Dark"
}
```

## Color Palette

- **Backgrounds**: `#383c4a`, `#404651`, `#474c5b`
- **Borders**: `#2b2e39`
- **Accent/Focus**: `#2679db` (Arc blue)
- **Text**: `#d3dae3`, `#ffffff`
- **Muted**: `#9ba2ab`
- **Keywords**: `#ffa833` (orange)
- **Strings**: `#c6ffa8` (green)
- **Comments**: `#a9a9a9` (gray)
- **Functions**: `#ffc369` (yellow)
- **Types**: `#a8ebff` (cyan)

## Development

To modify the theme, edit `arc-dark.json` and place it in `~/.config/zed/themes/`. Changes will be applied after restarting Zed.

For rapid iteration, use `experimental.theme_overrides` in your Zed settings:

```json
{
  "theme": "Arc Dark",
  "experimental.theme_overrides": {
    "editor.background": "#383c4a"
  }
}
```

## Credits

- Original Arc Theme by horst3180
- IntelliJ Arc Dark Theme by Pavel Zlámal
- Adapted for Zed by wcygan
