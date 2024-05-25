#!/bin/bash
verbose=1
terminal=alacritty
rofi=0
if [ "$1" == "rofi" ]; then
	rofi=1
fi

cd "$HOME/projects/launch/" || exit
project_launchers=$HOME/projects/launch

list=$(ls | grep -v launch.sh)
if [ $verbose -eq 1 ]; then
	echo projects list:
	for i in $list; do
		echo -e "\033[0;32m$i\033[0m"
	done
fi

if [ $rofi -eq 1 ]; then
	selected_project=$(echo $list | tr " " "\n" | rofi -dmenu -p "Select project: ")
	if [ -n "$selected_project" ]; then
		$terminal -e "$project_launchers/$selected_project"
	fi
else
	selected_project=($(echo $list | tr " " "\n" | fzf --preview "cat {}" --preview-window=right:60%:wrap --height=40% --border --prompt="Select project: "))
	if [ -n "$selected_project" ]; then
		echo -e "\033[0;32mRunning $selected_project\033[0m"
		"$project_launchers/$selected_project"
	fi
fi
