if type -q tmux
    abbr t tmux
    abbr tks 'tmux kill-session'
    abbr tls 'tmux list-sessions'
    abbr tlc 'tmux list-clients'
    abbr tns 'tmux new -s'
end

if type -q lazydocker
    abbr lzd lazydocker
end

if type -q lazygit
    abbr lzg lazygit
end

if type -q cargo
    abbr cr cargo r
    abbr cb cargo b
    abbr ct cargo t
end

abbr v nvim

abbr GF git fetch --all
abbr GP git pull
