#!/bin/bash

# Arc Dark Theme for Zed - Installation Script

set -e

THEME_DIR="$HOME/.config/zed/themes"
THEME_FILE="themes/arc-dark.json"

echo "Installing Arc Dark theme for Zed..."

# Create themes directory if it doesn't exist
mkdir -p "$THEME_DIR"

# Copy theme file
cp "$THEME_FILE" "$THEME_DIR/"

echo "✓ Theme installed successfully to $THEME_DIR/arc-dark.json"
echo ""
echo "Next steps:"
echo "1. Restart Zed"
echo "2. Open Settings (Cmd+, or Ctrl+,)"
echo "3. Select 'Arc Dark' from the theme selector"
echo ""
echo "Enjoy your Arc Dark theme!"
