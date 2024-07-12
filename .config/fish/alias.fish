

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
    alias tlc 'tmux list-clients'
    alias tns 'tmux new -s'
end

alias getip 'curl https://ipinfo.io/ip'

alias rat bat
alias c '/usr/bin/code --password-store="gnome"'
alias ppc powerprofilesctl
alias cq /home/mhiri/code/scripts/cq.sh
alias outdated 'paru -Qu| wc -l'

alias todo "todoist-cli --color --namespace --indent"

alias vivaldi "/usr/bin/vivaldi --enable-features=UseOzonePlatform --ozone-platform=wayland --use-cmd-decoder=validating --use-gl=desktop"

if test -f $HOME/scripts/launch.fish
    alias launch 'fish $HOME/scripts/launch.fish'
end


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
