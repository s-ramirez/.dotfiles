#!/usr/bin/env bash
# Check for Homebrew and install if not present
if test ! $(which brew); then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
  echo "Homebrew is already installed"
fi

/opt/homebrew/bin/brew update

echo "📦 Installing Packages"
/opt/homebrew/bin/brew install fzf stow tmux jq remarshal stern helm kubectl tmux-sessionizer rg pkl

echo "💻 Installing Applications"
/opt/homebrew/bin/brew install --cask ghostty
/opt/homebrew/bin/brew install --cask rectangle
/opt/homebrew/bin/brew install neovim

echo "🔠 Installing Fonts"
/opt/homebrew/bin/brew install --cask font-fira-mono-nerd-font

echo "✅ Installation using Homebrew is complete"
