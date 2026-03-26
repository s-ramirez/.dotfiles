#!/usr/bin/env bash

STOW=$(command -v stow || echo "/opt/homebrew/bin/stow")
if [ ! -x "$STOW" ]; then
  echo "Error: stow not found in PATH or /opt/homebrew/bin. Is Homebrew installed?" >&2
  exit 1
fi

# Fall back to xterm-256color if the current TERM isn't in the terminfo database
if ! infocmp "$TERM" &>/dev/null; then
  export TERM=xterm-256color
fi

echo "🧑‍💻 Stowing dotfiles..."
$STOW -v --target=$HOME zsh
mkdir -p $HOME/.config
$STOW -v --target=$HOME/.config config
TMUX_BIN=$(command -v tmux || echo "/opt/homebrew/bin/tmux")
if [ ! -x "$TMUX_BIN" ]; then
  echo "Warning: tmux not found, skipping TPM plugin install." >&2
else
  PATH="$(dirname "$TMUX_BIN"):$PATH" $HOME/.tmux/plugins/tpm/bin/install_plugins
fi
echo "🚀 Stow complete!"
