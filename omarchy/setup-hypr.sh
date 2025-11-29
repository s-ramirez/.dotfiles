#!/usr/bin/env bash
echo "🧑‍💻 Stowing dotfiles..."
stow -v --target=$HOME/.config/hypr hypr
echo "🚀 Stow complete!"
