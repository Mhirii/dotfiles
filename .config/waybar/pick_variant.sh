#!/bin/bash

# variants should be directory in $HOME/.config/waybar/variants
# variants=$(ls ./variants)
cd "$HOME"/.config/waybar/variants || exit
variants=$(ls -d */ | sed 's/\///')
selected_variant=$(echo -e "$variants" | rofi -dmenu -i -config "$HOME/.config/rofi/config.rasi" "Select variant: ")

waybar_path="$HOME/.config/waybar"
variant_path="$waybar_path/variants/$selected_variant"

set_selected_variant() {
	ln -sf "$variant_path/config.jsonc" "$waybar_path/config.jsonc"
	ln -sf "$variant_path/style.css" "$waybar_path/style.css"
	pkill waybar
	waybar &
	notify-send "Waybar" "Current variant: $selected_variant"
}

set_selected_variant
