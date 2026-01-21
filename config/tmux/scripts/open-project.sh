#!/usr/bin/env bash

# Customizable project directory
PROJECT_DIR="${PROJECT_DIR:-$HOME/Documents/Development}"

# Use find to list all directories in PROJECT_DIR and pipe to fzf
selected=$(find "$PROJECT_DIR" -mindepth 1 -maxdepth 1 -type d -exec test -d {}/.git \; -print | fzf --prompt="Select project: ")

# Exit if no selection was made
if [[ -z $selected ]]; then
    exit 0
fi

# Get the folder name for the session name
selected_name=$(basename "$selected" | tr . _)

# Check if we're inside a tmux session
tmux_running=$(pgrep tmux)

# If not in tmux and tmux isn't running, create new session
if [[ -z $TMUX ]] && [[ -z $tmux_running ]]; then
    tmux new-session -s "$selected_name" -c "$selected" -d
    tmux send-keys -t "$selected_name" "nvim ." C-m
    tmux split-window -v -p 20 -d -t "$selected_name" -c "$selected"
    tmux attach-session -t "$selected_name"
    exit 0
fi

# Check if session already exists
if ! tmux has-session -t="$selected_name" 2> /dev/null; then
    # Create new session in detached mode
    tmux new-session -ds "$selected_name" -c "$selected"
    # Open nvim in the first pane with the project folder
    tmux send-keys -t "$selected_name" "nvim ." C-m
    # Split window vertically and create second pane (20% height), keep focus on nvim pane
    tmux split-window -v -p 20 -d -t "$selected_name" -c "$selected"
fi

# Switch to the session
tmux switch-client -t "$selected_name"
