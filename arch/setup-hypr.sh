#!/bin/sh
set -e
echo "Installing packages..."
sudo pacman -S ghostty stow tmux nvim steam discord waybar otf-font-awesome hypridle hyprlock pavucontrol unzip file-roller
yay -S swaync
../setup-dotfiles.sh
../other-install.sh
echo "🧑‍💻 Stowing dotfiles..."
mkdir -p $HOME/.config/waybar
mkdir -p $HOME/.config/hypr
rm -f $HOME/.config/hypr/hyprland.conf 2> /dev/null
stow -v --target=$HOME/.config/hypr hypr
stow -v --target=$HOME/.config/waybar waybar 
echo "🚀 Stow complete!"
