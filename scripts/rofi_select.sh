#!/bin/bash

options=" Theme \n Waybar \n Tmux \n Ags \n rofi \n icons "
selected=$(echo -e "$options" | rofi -dmenu -i -p "Select Option")

case $selected in
" Theme ")
	$HOME/scripts/pick_theme.sh
	;;
" Waybar ")
	cd $HOME/.config/waybar
	$HOME/.config/waybar/pick_variant.sh
	;;
" Ags ")
	notify-send "WIP"
	;;
" rofi ")
	rofi -show drun
	;;
" Tmux ")
	"$HOME/scripts/rofi_tmux.sh"
	;;
" icons ")
	bat "$HOME/Documents/nerdfont.txt" | rofi -dmenu -i | awk '{print $1}' | wl-copy
	;;
esac
