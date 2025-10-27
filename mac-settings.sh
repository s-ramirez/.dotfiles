e!/usr/bin/env zsh

#======================Dock settings =================
defaults write com.apple.dock "show-recents" -bool false # Do not display recent apps in the Dock
defaults write com.apple.dock "autohide" -bool true # Autohide dock
defaults write com.apple.dock autohide-delay -float 0 # Remove auto-hide delay
defaults write com.apple.dock autohide-time-modifier -float 0.5 # Auto-hide faster
defaults write com.apple.dock "mineffect" -string "genie" # Genie effect for minimizing windows (default)
defaults write com.apple.dock "magnification" -float 0.75 # Genie effect for minimizing windows (default)
killall Dock # Restart Dock to apply changes

#======================Screencapture settings =================
mkdir -p $HOME/Desktop/Screenshots # Create "Screenshots" folder on the desktop and set it as the default location 
defaults write com.apple.screencapture "location" $HOME/Desktop/Screenshots  
defaults write com.apple.screencapture "show-thumbnail" -bool true # Display the thumbnail after taking a screenshot (default)
defaults write com.apple.screencapture "include-date" -bool false # Don't include date in the screenshot file name
defaults write com.apple.screencapture "target" -string "clipboard" # Copy screenshots to clipboard instead of saving them

#======================Finder settings =================
defaults write NSGlobalDomain "AppleShowAllExtensions" -bool true # Show filename extensions 
defaults write com.apple.finder "ShowPathbar" -bool true # Show path bar in the bottom of the Finder windows

#======================Mission Control settings =================
defaults write com.apple.dock "mru-spaces" -bool false # Do not rearrange spaces based on most recent use
defaults write com.apple.dock "expose-group-apps" -bool false # Do not group windows by application (default)

#=========Change default location of Hammerspoon config===========
defaults write org.hammerspoon.Hammerspoon MJConfigFile "${HOME}/.config/hammerspoon/init.lua"
