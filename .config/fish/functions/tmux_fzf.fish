
function tmux_fzf
    set prev (pwd)
    zi
    set name (basename (pwd))
    if test "$name" != mhiri
        if tmux has-session -t $name
            tmux attach -t $name
        else
            tmux new -s (basename (pwd))
        end
        cd $prev
    end
    starship prompt
end
