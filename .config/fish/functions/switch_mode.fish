
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
