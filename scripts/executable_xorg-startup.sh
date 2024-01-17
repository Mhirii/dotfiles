#!/bin/bash

function run() {
	local cmd=$@
	if ! pgrep -x $cmd; then
		$cmd &
	fi
}
pkill picom
sleep 0.1
picom --backend glx --config ~/.config/awesome/conf/picom.conf &
# sh ~/.screenlayout/reddragon.sh
run nm-applet --indicator
run blueman-applet
# dunst &
# feh --bg-fill --randomize ~/.config/qtile/wallpapers/ &
run alacritty
run xclip
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
disown
# flameshot &
run copyq
run pasystray
sleep 1

run megasync
run telegram-desktop
