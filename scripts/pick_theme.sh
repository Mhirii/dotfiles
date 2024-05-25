#!/bin/bash

themes=$(echo -e " Tokyonight \n Rosepine \n Nero \n IDX ")
selected_theme=$(echo -e "$themes" | rofi -dmenu -i -config ~/.config/rofi/config.rasi)
fish=~/.config/fish/current_theme.fish
wezterm=~/.config/wezterm/ui.lua
chezmoi=~/.config/chezmoi/chezmoi.toml
nvim=~/.config/nvim/lua/custom/ui.lua

alacritty_theme() {
	theme_name="$1"
	theme_path="${HOME}/.config/alacritty/themes/${theme_name}.toml"
	current_theme_path="${HOME}/.config/alacritty/current_theme.toml"

	if [[ -f "$theme_path" ]]; then             # Check if the theme file exists
		ln -sf "$theme_path" "$current_theme_path" # Create the symbolic link
		echo "Alacritty theme set to $theme_name." # Success message
	else
		echo "Theme file $theme_path not found." # Error message if the theme file doesn't exist
	fi
}

rofi_theme() {
	theme_path=${HOME}/.config/rofi/themes/${1}.rasi
	ln -sf $theme_path $HOME/.config/rofi/theme.rasi
}

mako_theme() {
	theme_path=${HOME}/.config/mako/${1}
	default_path=${HOME}/.config/mako/default
	config_path=${HOME}/.config/mako/config
	cp "$default_path" "$config_path"
	cat "$theme_path" >>"$config_path"
	makoctl reload
}

link_wallpaper() {
	ln -sf $HOME/.config/hypr/wallpapers/$1.png $HOME/.config/hypr/background.png
}

set_wallpaper() {
	# pos=$(hyprctl cursorpos | sed 's/-//' | sed 's/\ //')
	# swww img --transition-type grow --transition-duration 2.0 $HOME/.config/hypr/background.png
	pkill hyprpaper
	hyprpaper &
}

set_hypr_theme() {
	sed -i "s/theme =.*/theme = $1/" $HOME/.config/hypr/hyprlock.conf
	sed -i "s/theme =.*/theme = $1/" $HOME/.config/hypr/hyprland.conf

}

set_ags_theme() {
	if pgrep -x "ags" >/dev/null; then
		ags -r "(await import('file://$HOME/.config/ags/js/settings/theme.js')).setTheme('$1')"
	fi
}

set_waybar_theme() {
	theme_path=${HOME}/.config/waybar/themes/${1}.css
	ln -sf $theme_path $HOME/.config/waybar/theme.css
	procs=$(pgrep -x ags | wc -l)
	pkill waybar
	if [ $procs -lt 1 ]; then
		waybar &
	fi
}

set_theme() {
	alacritty_theme $1
	rofi_theme $1
	mako_theme $1
	case $1 in
	"tokyonight")
		set_ags_theme Tokyo
		sed -i 's/set -x theme .*$/set -x theme tokyonight/' $fish
		sed -i 's/M.color_scheme = "\(.*\)"/M.color_scheme = "tokyonight"/' $wezterm
		sed -i 's/theme = "\(.*\)"/theme = "tokyonight"/' $chezmoi
		link_wallpaper tokyo
		set_wallpaper tokyo
		set_hypr_theme tokyonight
		sed -i 's/theme = ".*", -- sed mark/theme = "tokyonight", -- sed mark/' $nvim
		set_waybar_theme tokyonight
		;;
	"rosepine")
		set_ags_theme RosePine
		sed -i 's/set -x theme .*$/set -x theme rosepine/' $fish
		sed -i 's/M.color_scheme = "\(.*\)"/M.color_scheme = "rosepine"/' $wezterm
		sed -i 's/theme = "\(.*\)"/theme = "rosepine"/' $chezmoi
		link_wallpaper pine
		set_wallpaper pine
		set_hypr_theme rosepine
		sed -i 's/theme = ".*", -- sed mark/theme = "rosepine", -- sed mark/' $nvim
		set_waybar_theme rosepine
		;;
	"nero")
		set_ags_theme nero
		sed -i 's/set -x theme .*$/set -x theme nero/' $fish
		sed -i 's/M.color_scheme = "\(.*\)"/M.color_scheme = "nero"/' $wezterm
		sed -i 's/theme = "\(.*\)"/theme = "nero"/' $chezmoi
		link_wallpaper nero
		set_wallpaper nero
		set_hypr_theme nero
		sed -i 's/theme = ".*", -- sed mark/theme = "nero", -- sed mark/' $nvim
		set_waybar_theme nero
		;;
	"idx")
		set_ags_theme idx
		sed -i 's/set -x theme .*$/set -x theme idx/' $fish
		sed -i 's/M.color_scheme = "\(.*\)"/M.color_scheme = "idx"/' $wezterm
		sed -i 's/theme = "\(.*\)"/theme = "idx"/' $chezmoi
		link_wallpaper idx
		set_wallpaper idx
		set_hypr_theme idx
		sed -i 's/theme = ".*", -- sed mark/theme = "idx", -- sed mark/' $nvim
		set_waybar_theme idx
		;;
	esac
}

case $selected_theme in
" Tokyonight ")
	set_theme tokyonight
	notify-send theme tokyo
	;;
" Rosepine ")
	set_theme rosepine
	notify-send theme pine
	;;
" Nero ")
	set_theme nero
	notify-send theme nero
	;;
" IDX ")
	set_theme idx
	notify-send theme idx
	;;
esac
