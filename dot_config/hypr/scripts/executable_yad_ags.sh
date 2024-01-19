#!/bin/bash

yad --width=330 --height=360 \
	--center \
	--fixed \
	--title="Ags Submap" \
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
	"D" " " "Dashboard" \
	"O" " " "Overview" \
	"S" " " "QuickSettings" \
