#!/usr/bin/env bash
echo "🧑‍💻 Stowing dotfiles..."
stow -v --target=$HOME/.config/hypr hypr
stow -v --target=$HOME/.config/waybar waybar 
echo "🚀 Stow complete!"
