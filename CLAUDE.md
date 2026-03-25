# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

Personal dotfiles repo managing configurations for macOS and Arch Linux. Uses **GNU Stow** to symlink config files into place.

## Setup & Installation

```bash
./install-all.sh        # Runs all install scripts in order: mac-settings → brew-install → other-install → setup-dotfiles
./setup-dotfiles.sh     # Stow only: symlinks zsh/ → $HOME, config/ → $HOME/.config
./brew-install.sh       # Homebrew packages and casks
./mac-settings.sh       # macOS defaults (dock, finder, screenshots, hammerspoon config path)
```

## Stow Convention

This is the key thing to understand: directories at the repo root are **stow packages**. The stow target determines where symlinks land:

- `zsh/` → stowed to `$HOME` (files like `.zshrc`, `.zsh_profile`, `.p10k.zsh`)
- `config/` → stowed to `$HOME/.config` (subdirectories become `~/.config/nvim`, `~/.config/tmux`, etc.)
- `arch/` → **not stowed automatically**; contains Hyprland configs for Arch Linux (`arch/setup-hypr.sh` handles that separately)

When adding new config files, place them in the correct stow package directory so the path after stowing matches where the tool expects its config.

## Key Configurations

- **Neovim**: Based on kickstart.nvim. Single `init.lua` with inline plugin specs. Uses lazy.nvim for plugin management.
- **Tmux**: TPM for plugins. Catppuccin macchiato theme. Vim-tmux-navigator integration. Resurrect + Continuum for session persistence.
- **Zsh**: Zinit plugin manager. Powerlevel10k prompt. Custom aliases/functions in `.zsh_profile` (heavy Kubernetes tooling).
- **Hammerspoon**: Replaces Rectangle for window management. Uses Hyper key (cmd+alt+ctrl+shift). Two modules: `window-management.lua` (tiling with h/j/k/l/m) and `launcher.lua` (app switching with Hyper+key).
- **Ghostty**: Terminal emulator config. Tokyo Night theme, JetBrains Mono font.
- **Hyprland** (Arch only): Modular config split across multiple `.conf` files sourced from `hyprland.conf`.

## Shell Aliases (zsh/.zsh_profile)

The `.zsh_profile` contains extensive Kubernetes helper functions (`pod`, `k8log`, `k8shell`, `k8f`, `k8def`, `delpods`, etc.) and Python venv aliases. A separate `.zsh_profile_work` is sourced if present but not tracked in git.
