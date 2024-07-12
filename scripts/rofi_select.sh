#!/bin/bash

options=" Theme \n Waybar \n Tmux \n Ags \n rofi \n icons "
selected=$(echo -e "$options" | rofi -dmenu -i -p "Select Option")

case $selected in
" Theme ")
  # check if $HOME/.config/hypr/scripts/set_theme.sh exists
  if [ -f "$HOME/.config/hypr/scripts/set_theme.sh" ]; then
    "$HOME/.config/hypr/scripts/set_theme.sh" rofi
  else
    echo "set_theme.sh not found in $HOME/.config/hypr/scripts/"
  fi
  ;;
" Waybar ")
  cd "$HOME/.config/waybar" || exit
  "$HOME/.config/waybar/pick_variant.sh"
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
