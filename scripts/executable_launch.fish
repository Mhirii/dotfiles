#!/usr/bin/fish

if test -z "$argv[1]"
    echo "Please provide an argument"
    exit 1
end

set arg $argv[1]

# defaults
set browser $BROWSER
set terminal wezterm
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

function run_electron
    if test $XDG_SESSION_TYPE = wayland
        $argv[1] --ozone-platform=wayland --enable-features=UseOzonePlatform,WaylandWindowDecorations,WebRTCPipeWireCapturer
    else
        $argv[1]
    end
end

switch $arg
    # Hyprland Only
    case browser
        if isRunning firefox
            hyprctl dispatch workspace (getWorkspaceId "firefox")
        else
            firefox
        end

    case code
        code \
            --ozone-platform=wayland \
            --enable-features=UseOzonePlatform,WaylandWindowDecorations,WebRTCPipeWireCapturer

    case rofi
        rofi -show drun

    case launcher
        ags -t applauncher

    case terminal
        wezterm
    case terminal1
        alacritty
    case terminal2
        footclient

    case zellij
        if test ( zellij ls | rg main )
            $terminal -e --hold zellij a main &
        else
            $terminal -e --hold zellij -s main -l main &
        end

    case tmux
        alacritty -T tmux -e tmux a &

    case nvim
        $terminal --hold -e nvim &
    case neovide
        neovide

    case lunarvim
        $terminal --hold -e lvim &
    case lunarvide
        neovide --neovim-bin ~/.local/bin/lvim --multigrid

    case filesgui
        $files

    case filestui
        $terminal -e ranger &

    case clipboard
        cliphist list | rofi -dmenu | cliphist decode | wl-copy

    case spotify
        run_electron spotify

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
end
