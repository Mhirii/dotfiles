#!/usr/bin/env bash
path=$1
hyprctl hyprpaper preload "$path"
hyprctl hyprpaper wallpaper ", $path"
