#!/bin/bash

yad --width=330 --height=360 \
	--center \
	--fixed \
	--title="Launch Submap" \
	--no-buttons \
	--list \
	--column= \
	--column= \
	--column= \
	--timeout=6000 \
	--no-escape \
	--hscroll-policy=never \
	--vscroll-policy=never \
	--no-click \
	--fontname='FiraCode Nerd Font' \
	--no-selection \
	--timeout-indicator=right \
	"ESC" "󰗼 " "Exit Submap" \
	"T" " " "lxtask" \
	"A" " " "Alacritty" \
	"S" "󰓇 " "Spotify" \
	"󰘶 S" "󰓇 " "spt" \
	"D" "󰙯 " "discord" \
	"G" "󰊤 " "open repo from clipboard" \
	"K" " " "Kitty" \
	"C" "󰨞 " "Code" \
	"B" " " "Bitwarden" \
	"N" " " "Neovim" \
	"󰘶 N" "󱕅 " "Neovide"
