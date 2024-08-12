#!/usr/bin/env fish

if test -z "$argv[1]"
    echo "Please provide an argument"
    exit 1
end

set arg $argv[1]

# defaults
set terminal alacritty
set editor $EDITOR
set files $FILEMANAGER


function isRunning
    set appName $argv[1]
    if pgrep -x $appName >/dev/null
        return 0
    else
        return 1
    end
end

# Hyprland Only
function getWorkspaceId
    set appName $argv[1]
    set client (hyprctl clients -j | jq ".[] | select(.initialClass == \"$appName\") | .workspace.id")
    if test -n "$client"
        echo $client
    else
        echo 9 # Return 9 to indicate that the application is not running in any workspace
    end
end

function handleWarp
    hyprctl dispatch focuswindow "dev.warp.Warp"
    hyprctl dispatch togglefloating "dev.warp.Warp"
    hyprctl dispatch movetoworkspace 1
end

function run_electron
    if test $XDG_SESSION_TYPE = wayland
        $argv[1] --ozone-platform=wayland --enable-features=UseOzonePlatform,WaylandWindowDecorations,WebRTCPipeWireCapturer
    else
        $argv[1]
    end
end

function getAccentColor
  set themedir "$HOME/.config/hypr/themes"
  set themefile "$themedir/$theme.conf"
  set accentname (less "$themefile" | rg accent | awk '{print $3}' | sed 's/\$//')
  set accentcolor (less "$themefile" | rg "$accentname = " | awk '{print $3}')
  echo $accentcolor
end

switch $arg
    # Hyprland Only
    case firefox
        if isRunning firefox
            hyprctl dispatch workspace (getWorkspaceId "firefox")
        else
            firefox
        end

    case browser
        if pgrep brave >/dev/null
            set browserClient (hyprctl clients -j | jq ".[] | select(.initialClass == \"Brave-browser\") | .workspace.id")
            if test -n "$browserClient"
                hyprctl dispatch workspace $browserClient
            end
        else
            brave
        end


    case code
        /usr/bin/code \
            --password-store="gnome" --ozone-platform=wayland

    case rofi
        rofi -show drun

    case dmenu
        bemenu-run


    case launcher
        ags -t applauncher

    case terminal
        $terminal
    case terminal2
        alacritty

    case tmux
        if tmux has
            alacritty -T tmux -e tmux a &
        else
            tmux new -d -s Default
            alacritty -T tmux -e tmux a &
        end

    case nvim
        $terminal --hold -e nvim &
    case neovide
        neovide

    case lunarvim
        $terminal --hold -e lvim &
    case lunarvide
        neovide --neovim-bin ~/.local/bin/lvim

    case filesgui
        $files

    case filestui
        $terminal -e ranger &

    case clipboard
        cliphist list | rofi -dmenu | cliphist decode | wl-copy

    case spotify
        spotify-launcher

    case spt
        spotifyd
        $terminal -e spt &
        $terminal -e cava &

    case passwords
        run_electron bitwarden-desktop &

    case http
        run_electron insomnia &

    case insomnia
        run_electron insomnia &

    case warp
        if test (hyprctl clients -j | jq '.[] | select(.class == "dev.warp.Warp")' | wc -l) -eq 0
            warp-terminal & disown
            set warpIsOpen (hyprctl clients -j | jq '.[] | select(.class == "dev.warp.Warp")' | wc -l)
            while test $warpIsOpen -eq 0
                set warpIsOpen (hyprctl clients -j | jq '.[] | select(.class == "dev.warp.Warp")' | wc -l)
                echo
                echo
                echo
                echo "warp = $warpIsOpen"
                echo "Waiting for Warp to open"
                echo
                echo
                echo
                sleep 0.1
            end
            handleWarp
        else
            hyprctl dispatch focuswindow "dev.warp.Warp"
        end

    case hypr_launch
        hyprctl keyword general:col.active_border "rgba(bada55ff) rgba(1a1b26ff)"
    case hypr_reset
        if test (pgrep ags)
            notify-send Hyprland "Resetting Hyprland"
            switch $theme
                case tokyonight
                    ags -r "(await import('file://$HOME/.config/ags/js/settings/theme.js')).setTheme('Tokyo')"
                case rosepine
                    ags -r "(await import('file://$HOME/.config/ags/js/settings/theme.js')).setTheme('RosePine')"
                case nero
                    ags -r "(await import('file://$HOME/.config/ags/js/settings/theme.js')).setTheme('nero')"
                case idx
                    ags -r "(await import('file://$HOME/.config/ags/js/settings/theme.js')).setTheme('idx')"
            end
        end
            set accentcolor (getAccentColor)
                hyprctl keyword general:col.active_border "$accentcolor"
    case hypr_windowmode
        hyprctl keyword general:col.active_border "rgba(FA7A55ff) rgba(00000000) rgba(FA7A55ff) rgba(00000000)"
end
