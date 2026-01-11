#!/bin/bash

echo "Installing Cosmic Clipboard Manager..."

# 1. Install Dependencies
# Check for apt
if command -v apt &> /dev/null; then
    sudo apt update
    sudo apt install -y python3-gi wl-clipboard
else
    echo "Warning: Not on Debian/Ubuntu. Please ensure python3-gi and wl-clipboard are installed."
fi

# Install cliphist if not present
if ! command -v cliphist &> /dev/null; then
    echo "Installing cliphist..."
    wget https://github.com/sentriz/cliphist/releases/download/v0.5.0/cliphist-linux-amd64 -O cliphist
    chmod +x cliphist
    sudo mv cliphist /usr/local/bin/
fi

# 2. Copy Files
mkdir -p ~/.local/bin
cp src/cosmic-clipboard-manager ~/.local/bin/
chmod +x ~/.local/bin/cosmic-clipboard-manager

mkdir -p ~/.local/share/icons/hicolor/scalable/apps
cp assets/cosmic-clipboard-manager.svg ~/.local/share/icons/hicolor/scalable/apps/

mkdir -p ~/.local/share/applications
cp assets/cosmic-clipboard-manager.desktop ~/.local/share/applications/

# 3. Setup Systemd Services
mkdir -p ~/.config/systemd/user
cp assets/systemd/*.service ~/.config/systemd/user/
systemctl --user daemon-reload
systemctl --user enable --now cliphist.service
systemctl --user enable --now cliphist-images.service

# 4. Update Icon Cache
gtk-update-icon-cache -f -t ~/.local/share/icons/hicolor

echo "Installation Complete!"
echo "Please assign 'cosmic-clipboard-manager' to a shortcut (e.g. Super+V) in your system settings."
