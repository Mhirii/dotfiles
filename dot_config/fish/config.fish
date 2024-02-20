
#          ╭──────────────────────────────────────────────────────────╮
#          │                      Env Variables                       │
#          ╰──────────────────────────────────────────────────────────╯

# ━━ Set values ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
# Hide welcome message & ensure we are reporting fish as shell
set fish_greeting
set VIRTUAL_ENV_DISABLE_PROMPT 1
set -x MANPAGER "sh -c 'col -bx | bat -l man -p'"
set -x SHELL /usr/bin/fish

set -x QT_QPA_PLATFORMTHEME qt5ct

if test "$DESKTOP_SESSION" = awesome
    set -x GDK_BACKEND x11
    set -x QT_QPA_PLATFORM xcb
else if test "$DESKTOP_SESSION" = hyprland -o "$DESKTOP_SESSION" = Hyprland
    # set -x GDK_BACKEND wayland
    set -x QT_QPA_PLATFORM wayland
end

# Set settings for https://github.com/franciscolourenco/done
set -U __done_min_cmd_duration 10000
set -U __done_notification_urgency_level low


# ━━ Environment setup ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
# Apply .profile: use this to put fish compatible .profile stuff in
if test -f ~/.fish_profile
    source ~/.fish_profile
end

set -x XDG_DATA_HOME $HOME/.local/share
set -x XDG_CONFIG_HOME $HOME/.config
set -x XDG_STATE_HOME $HOME/.local/state
set -x XDG_CACHE_HOME $HOME/.cache

set -x CARGO_HOME $XDG_DATA_HOME/cargo
set -x CUDA_CACHE_PATH $XDG_CACHE_HOME/nv
set -x GTK2_RC_FILES $XDG_CONFIG_HOME/gtk-2.0/gtkrc
set -x RUSTUP_HOME $XDG_DATA_HOME/rustup
set -x GOPATH $XDG_DATA_HOME/go
set -x GOBIN $GOPATH/bin

# ━━ Default Apps ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
set -x BROWSER vivaldi
set -x FILEMANAGER thunar
set -x EDITOR nvim
set -x TERMINAL wezterm
set -x VISUAL nvim

# ━━ other env variables ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
source ~/.config/fish/env.fish

#          ╭──────────────────────────────────────────────────────────╮
#          │                           path                           │
#          ╰──────────────────────────────────────────────────────────╯

set -Ux fish_user_paths /usr/local/bin
if test -d ~/.local/bin
    if not contains -- ~/.local/bin $PATH
        set -p PATH ~/.local/bin
    end
end

set -Ua fish_user_paths /home/mhiri/.local/share/cargo/bin
fish_add_path -U $CARGO_HOME/bin

# pnpm
set -gx PNPM_HOME "/home/mhiri/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
    set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end

# Turso

set TURSO "/home/mhiri/.turso"
fish_add_path -U $TURSO
set -gx BUN_INSTALL "$HOME/.bun"
fish_add_path -U $BUN_INSTALL/bin

fish_add_path -U $GOPATH
fish_add_path -U $GOBIN

set cf $XDG_CONFIG_HOME
set cm_conf $XDG_CONFIG_HOME/chezmoi/chezmoi.toml
set cm_data $XDG_DATA_HOME/chezmoi


# ━━ Functions needed for !! and !$ https://github.com/oh-my-fish/plugin-bang-bang ━━
function __history_previous_command
    switch (commandline -t)
        case "!"
            commandline -t $history[1]
            commandline -f repaint
        case "*"
            commandline -i !
    end
end

function __history_previous_command_arguments
    switch (commandline -t)
        case "!"
            commandline -t ""
            commandline -f history-token-search-backward
        case "*"
            commandline -i '$'
    end
end

if [ "$fish_key_bindings" = fish_vi_key_bindings ]
    bind -Minsert ! __history_previous_command
    bind -Minsert '$' __history_previous_command_arguments
else
    bind ! __history_previous_command
    bind '$' __history_previous_command_arguments
end


source ~/.config/fish/alias.fish
source ~/.config/fish/binds.fish

#          ╭──────────────────────────────────────────────────────────╮
#          │                           init                           │
#          ╰──────────────────────────────────────────────────────────╯


zoxide init fish | source
thefuck --alias | source

if status --is-interactive
    source ("/usr/bin/starship" init fish --print-full-init | psub)
    if test -x /usr/bin/neofetch
        neofetch --ascii_colors 6 6 2 2 2 2
    end
end

source ~/.config/fish/current_theme.fish
fish_vi_key_bindings
