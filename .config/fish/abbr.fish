if test -x /usr/bin/tmux
    abbr t tmux
    abbr tks 'tmux kill-session'
    abbr tls 'tmux list-sessions'
    abbr tlc 'tmux list-clients'
    abbr tns 'tmux new -s'
end

if test -x /usr/bin/lazydocker
    abbr lzd lazydocker
end

if test -x /usr/bin/lazygit
    abbr lzg lazygit
end

if test -x /usr/bin/cargo
    abbr cr cargo r
    abbr cb cargo b
    abbr ct cargo t
end

abbr v nvim

abbr GF git fetch --all
abbr GP git pull
