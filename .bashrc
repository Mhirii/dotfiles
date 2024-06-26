#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

# ╭──────────────────────────────────────────────────────────╮
# │                        Variables                         │
# ╰──────────────────────────────────────────────────────────╯

export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_CACHE_HOME="$HOME/.cache"

export CARGO_HOME="$XDG_DATA_HOME/cargo"
export CUDA_CACHE_PATH="$XDG_CACHE_HOME/nv"
export GTK2_RC_FILES="$XDG_CONFIG_HOME/gtk-2.0/gtkrc"
export RUSTUP_HOME="$XDG_DATA_HOME/rustup"
export GOPATH="$XDG_DATA_HOME/go"
export GOBIN="$GOPATH/bin"

export BROWSER="vivaldi"
export FILEMANAGER="thunar"
export EDITOR="nvim"
export TERMINAL="alacritty"
export VISUAL="nvim"

export PNPM_HOME="/home/mhiri/.local/share/pnpm"

# ╭──────────────────────────────────────────────────────────╮
# │                         Aliases                          │
# ╰──────────────────────────────────────────────────────────╯
if [ -x "/usr/bin/eza" ]; then
	alias ls='eza -al --color=always --group-directories-first --icons'     # preferred listing
	alias la='eza -a --color=always --group-directories-first --icons'      # all files and dirs
	alias ll='eza -l --color=always --group-directories-first --icons'      # long format
	alias lt='eza -aT --color=always --group-directories-first --icons'     # tree listing
	alias l.='eza -ald --color=always --group-directories-first --icons .*' # show only dotfiles
fi

if [ -x "/usr/bin/bat" ]; then
	alias cat='bat --style header --style snip --style changes --style header'
fi
if [ -x "/usr/bin/lazygit" ]; then
	alias lg=lazygit
fi
if [ -x "/usr/bin/nvim" ]; then
	alias v=nvim
fi
if [ -x "$HOME/.local/bin/lvim" ]; then
	alias lv=lvim
fi
if [ -x "/usr/bin/tmux" ]; then
	alias t=tmux
	alias tks='tmux kill-session'
	alias tls='tmux list-sessions'
	alias tcs='tmux list-clients'
	alias tns='tmux new -s'
fi

alias getip='curl=https://ipinfo.io/ip'

alias rat="bat"
alias cm="chezmoi"
alias cme="chezmoi edit"
alias cmtest="chezmoi git pull -- --autostash --rebase && chezmoi diff"
alias c='/usr/bin/code --password-store="gnome"'
alias ppc="powerprofilesctl"
alias gclone="/home/mhiri/ghclone"
alias cq="/home/mhiri/code/scripts/cq.sh"
alias outdated='paru -Qu| wc -l'

if [ -f "$HOME/scripts/launch.fish" ]; then
	alias launch='fish $HOME/scripts/launch.fish'
fi

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

# ╭──────────────────────────────────────────────────────────╮
# │                        functions                         │
# ╰──────────────────────────────────────────────────────────╯
tmux_fzf() {
	zi
	tmux new -s "$(basename pwd)"
}

# ────────────────────────────────────────────────────────────────
# eval "$(starship init bash)"
eval "$(zoxide init bash)"
