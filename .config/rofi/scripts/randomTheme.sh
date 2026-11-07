#!/bin/bash

source "$(dirname "$0")/thumbcache"

themes_dir="$HOME/dotfiles/themes"
symphony="$HOME/dotfiles/install/themes/symphony"
current_theme=$(cat ~/.config/symphony/.current-theme 2>/dev/null || echo "dynamic")

get_valid_themes() {
    for dir in "$themes_dir"/*/; do
        name=$(basename "$dir")
        # Skip system/meta folders
        [[ "$name" == "Wallpapers" || "$name" == ".git" ]] && continue
        # Must have a .config folder to be valid
        [[ ! -d "$dir/.config" ]] && continue
        echo "$name"
    done
}

choice=$(get_valid_themes | grep -v "^$current_theme$" | shuf -n 1)

# 2. Safety check: if no choice was made (e.g., only one theme exists)
[[ -z "$choice" ]] && exit 0

"$symphony" switch "$choice"
notify-send "Symphony" "Randomly switched to: $choice" -i preferences-desktop-theme
