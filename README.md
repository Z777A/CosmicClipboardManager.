# Cosmic Clipboard Manager

A lightweight, native-looking clipboard manager for the COSMIC Desktop Environment (and other Wayland compositors). Built with Python and GTK3, powered by `cliphist`.

## Features

- **Native UI**: Uses GTK3 to blend perfectly with COSMIC/Pop!_OS dark themes.
- **Single Click**: Activate items with a single mouse click.
- **Image Support**: Displays thumbnails for copied images.
- **Privacy & Cleanliness**: Hides binary garbage and duplicate file paths.
- **Performance**: Zero resource usage when closed.
- **Auto-Cleanup**: Automatically limits history to 25 items.

## Requirements

- `python3`
- `python3-gi` (PyGObject)
- `cliphist` (Go binary)
- `wl-clipboard`
- `libgtk-3-dev` (usually installed)

## Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/Z777A/CosmicClipboardManager.git
   cd CosmicClipboardManager
   ```

2. Run the installer:
   ```bash
   ./install.sh
   ```

3. Set up a keyboard shortcut in COSMIC Settings -> Keyboard -> Shortcuts -> Customize:
   - Command: `cosmic-clipboard-manager`
   - Key: `Super+V` (or your preference)

## License

MIT
