
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

# ━━ Default Apps ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
set -x BROWSER firefox
set -x FILEMANAGER thunar
set -x EDITOR nvim
set -x TERMINAL wezterm
set -x VISUAL neovide


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

set -gx BUN_INSTALL "$HOME/.bun"
fish_add_path -U $BUN_INSTALL/bin

fish_add_path -U $GOPATH
fish_add_path -U $GOBIN


#          ╭──────────────────────────────────────────────────────────╮
#          │                        Functions                         │
#          ╰──────────────────────────────────────────────────────────╯

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

# ━━ Fish command history ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
function history
    builtin history --show-time='%F %T '
end

function backup --argument filename
    cp $filename $filename.bak
end

# ━━ Cleanup local orphaned packages ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
function cleanup
    while pacman -Qdtq
        sudo pacman -R (pacman -Qdtq)
    end
end

function FD
    fd --base-directory ~ --absolute-path --hidden $argv

end

function Pac-keys
    pacman-key --init
    sudo pacman-key --populate archlinux $argv

end

function Pick
    gpick -p -s -o | copyq add -
    copyq select 0 $argv

end

function Update
    sudo pacman -Sy && sudo powerpill -Su && paru -Su $argv

end

function zoxide_find
    zi
    starship prompt
end

function gui_explore
    $FILEMANAGER .
end

function switch_mode
    if [ "$fish_key_bindings" = fish_vi_key_bindings ]
        fish_default_key_bindings
        set mode Default
    else
        fish_vi_key_bindings
        set mode Vim
    end

    echo "$mode Keybinds set"
    starship prompt
end


#          ╭──────────────────────────────────────────────────────────╮
#          │                         aliases                          │
#          ╰──────────────────────────────────────────────────────────╯

# ━━ Replace things with superior alternatives ━━━━━━━━━━━━━━━━━━━━━━━━━━━

# ls > eza
if test -x /usr/bin/eza
    alias ls 'eza -al --color=always --group-directories-first --icons' # preferred listing
    alias la 'eza -a --color=always --group-directories-first --icons' # all files and dirs
    alias ll 'eza -l --color=always --group-directories-first --icons' # long format
    alias lt 'eza -aT --color=always --group-directories-first --icons' # tree listing
    alias l. 'eza -ald --color=always --group-directories-first --icons .*' # show only dotfiles
else
    echo "Eza does not exist on your system!"
end

# cat > bat
if test -x /usr/bin/bat
    alias cat 'bat --style header --style snip --style changes --style header'
else
    echo "Bat does not exist on your system!"
end

# yay > paru
if not test -x /usr/bin/yay; and test -x /usr/bin/paru
    alias yay paru
end

if test -x /usr/bin/lazygit
    alias lg lazygit
end
if test -x /usr/bin/nvim
    alias v nvim
end
if test -x $HOME/.local/bin/lvim
    alias lv lvim
end
if test -x /usr/bin/wezterm
    alias wz wezterm
end

if test -x /usr/bin/tmux
    alias t tmux
    alias tks 'tmux kill-session'
    alias tls 'tmux list-sessions'
    alias tcs 'tmux list-clients'
    alias tns 'tmux new -s'
end

alias rat bat
alias cm chezmoi
alias code 'code --password-store="gnome"'
alias gclone /home/mhiri/ghclone
alias cq /home/mhiri/code/scripts/cq.sh
alias outdated 'paru -Qu| wc -l'


# ━━ Common use ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
alias .. 'cd ..'
alias ... 'cd ../..'
alias .... 'cd ../../..'
alias ..... 'cd ../../../..'
alias ...... 'cd ../../../../..'
alias big 'expac -H M "%m\t%n" | sort -h | nl' # Sort installed packages according to size in MB (expac must be installed)
alias fixpacman 'sudo rm /var/lib/pacman/db.lck'
alias gitpkg 'pacman -Q | grep -i "\-git" | wc -l' # List amount of -git packages
alias egrep 'ugrep -E --color=auto'
alias fgrep 'ugrep -F --color=auto'
alias hw 'hwinfo --short' # Hardware Info
alias ip 'ip -color'
alias psmem 'ps auxf | sort -nr -k 4'
alias psmem10 'ps auxf | sort -nr -k 4 | head -10'
alias rmpkg 'sudo pacman -Rdd'
alias tarnow 'tar -acf '
alias untar 'tar -zxvf '

# ━━ Get fastest mirrors ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
alias mirror 'sudo reflector -f 30 -l 30 --number 10 --verbose --save /etc/pacman.d/mirrorlist'

# ━━ Get the error messages from journalctl ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
alias jctl 'journalctl -p 3 -xb'

# ━━ Recent installed packages ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
alias rip 'expac --timefmt="%Y-%m-%d %T" "%l\t%n %v" | sort | tail -200 | nl'



#          ╭──────────────────────────────────────────────────────────╮
#          │                         keybinds                         │
#          ╰──────────────────────────────────────────────────────────╯

bind \cz undo

if [ "$fish_key_bindings" = fish_vi_key_bindings ]
    bind -Minsert ! __history_previous_command
    bind -Minsert '$' __history_previous_command_arguments

    bind -Minsert \ef zoxide_find
    bind -Minsert \ev nvim
    bind -Minsert \ee gui_explore
    bind -Minsert \eg lazygit

    bind right forward-char
    bind left backward-char

    # hjkl
    bind -Minsert \ch backward-char
    bind -Minsert \cj down-or-search
    bind -Minsert \ck up-or-search
    bind -Minsert \cl forward-char

    bind -Minsert \cx delete-char
    bind -Minsert \cb backward-word
    bind -Minsert \cw forward-word

    bind -Minsert \ca beginning-of-line
    bind -Minsert \ce end-of-line
    bind -Minsert \cp up-or-search
    bind -Minsert \cn down-or-search

    bind \e\e switch_mode
else
    bind ! __history_previous_command
    bind '$' __history_previous_command_arguments

    bind \ef zoxide_find
    bind \ev nvim
    bind \ee gui_explore
    bind \eg lazygit

    bind right forward-char
    bind left backward-char

    # hjkl
    bind \ch backward-char
    bind \cj down-or-search
    bind \ck up-or-search
    bind \cl forward-char

    bind \cx delete-char
    bind \cb backward-word
    bind \cw forward-word

    bind \ca beginning-of-line
    bind \ce end-of-line
    bind \cp up-or-search
    bind \cn down-or-search

    bind \e\e switch_mode
end



#          ╭──────────────────────────────────────────────────────────╮
#          │                           init                           │
#          ╰──────────────────────────────────────────────────────────╯


zoxide init fish | source
thefuck --alias | source

if status --is-interactive
    source ("/usr/bin/starship" init fish --print-full-init | psub)
    if test -x /usr/bin/neofetch
        neofetch --ascii_colors 1 1 2 2 2 2
    end
end

fish_vi_key_bindings
