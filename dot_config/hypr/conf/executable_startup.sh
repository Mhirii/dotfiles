#!/bin/bash

echo_color() {
	case $2 in
	"red") echo -e "\e[31m$1\e[0m" ;;
	"green") echo -e "\e[32m$1\e[0m" ;;
	"yellow") echo -e "\e[33m$1\e[0m" ;;
	"blue") echo -e "\e[34m$1\e[0m" ;;
	"magenta") echo -e "\e[35m$1\e[0m" ;;
	"cyan") echo -e "\e[36m$1\e[0m" ;;
	"white") echo -e "\e[37m$1\e[0m" ;;
	*) echo $1 ;;
	esac
}

echo_color "Starting up..." "green"

echo_color "Setting up wallpaper..." "cyan"
swww init
swww img --transition-type grow ~/.config/hypr/background.png
echo_color "Wallpaper set!" "green"

echo_color "Setting up widgets..." "cyan"
ags -t bar &
echo_color "Widgets set!" "green"

echo_color "Initializing tmux..." "cyan"
tmux new -s init &
echo_color "Tmux initialized!" "green"

echo_color "Starting up applications..." "cyan"
echo_color "Starting up clickup..." "blue"
clickup &
echo_color "done!" "green"

# echo_color "Starting up discord..." "blue"
# discord &
# echo_color "done!" "green"

hyprctl dispatch exec [workspace 1 silent] alacritty
hyprctl dispatch exec [workspace special silent] "alacritty -e ~/scripts/tmuxMain.sh"
hyprctl dispatch exec [workspace 8 silent] alacritty

# if battery level > 50% then echo yes, the command acpi -b returns Battery 0: Charging, 76%, 00:26:32 until charged
if [ "$(acpi -b | awk '{print $4}' | tr -d '%,')" -gt 50 ]; then
	hyprctl dispatch exec [workspace 2 silent] "$HOME/scripts/launch.fish" vivaldi
	hyprctl dispatch exec [workspace 5 silent] discord
	hyprctl dispatch exec [workspace 6 silent] spotify
fi

echo_color "Applications started!" "green"
