#!/usr/bin/env bash
echo "🧑‍💻 Stowing dotfiles..."
stow -v --target=$HOME zsh
mkdir -p $HOME/.config
stow -v --target=$HOME/.config config
$HOME/.tmux/plugins/tpm/bin/install_plugins
echo "🚀 Stow complete!"
