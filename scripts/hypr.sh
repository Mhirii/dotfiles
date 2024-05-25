#!/bin/bash

choice=$1
case $choice in
"blur")
	if [[ $(hyprctl getoption decoration:blur:enabled -j | jq '.int') -eq 1 ]]; then
		hyprctl keyword decoration:blur:enabled false
	else
		hyprctl keyword decoration:blur:enabled true
	fi
	;;
"animations")
	if [[ $(hyprctl getoption animations:enabled -j | jq '.int') -eq 1 ]]; then
		hyprctl keyword animations:enabled false
	else
		hyprctl keyword animations:enabled true
	fi
	;;
esac
