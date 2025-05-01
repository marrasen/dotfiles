#!/bin/bash

DOTFILES_DIR="$HOME/dotfiles"

# Create symlinks for scripts
mkdir -p "$HOME/bin"
for script in "$DOTFILES_DIR/bin"/*; do
    ln -sf "$script" "$HOME/bin/$(basename "$script")"
done

# Make sure ~/bin is in PATH
if [[ ":$PATH:" != *":$HOME/bin:"* ]]; then
    echo 'export PATH="$HOME/bin:$PATH"' >> "$HOME/.bashrc"
    source "$HOME/.bashrc"
fi

# Install required packages
echo "Installing required packages..."
sudo apt update
sudo apt install -y ffmpeg bs1770gain git

echo "Setup complete! Your scripts are now available."
