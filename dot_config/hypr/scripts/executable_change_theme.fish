#!/usr/bin/env fish

set themes $HOME/.config/hypr/themes

function make_links
    ln -sf $themes/$argv/$argv.css $HOME/.config/waybar/theme.css
    ln -sf $themes/$argv/$argv.conf $HOME/.config/hypr/conf/colors.conf
end

function restart_waybar
    pkill waybar
    waybar & disown
end

switch $argv
    case tokyonight
        make_links tokyonight
        restart_waybar
    case catppuccin
        make_links catppuccin
        restart_waybar
    case '*'
        echo "usage: ./change_theme.fish tokyonight | catppuccin"
end
