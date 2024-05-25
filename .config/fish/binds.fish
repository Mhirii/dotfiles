
bind \cz undo

if [ "$fish_key_bindings" = fish_vi_key_bindings ]

    bind -Minsert \cz undo
    bind \cz undo
    bind -Minsert ! __history_previous_command
    bind -Minsert '$' __history_previous_command_arguments

    bind -Minsert \ef zoxide_find
    bind \ef zoxide_find
    bind -Minsert \et tmux_fzf
    bind \et tmux_fzf
    bind -Minsert \eg lazygit
    bind \eg lazygit

    bind right forward-char
    bind left backward-char

    # hjkl
    bind -Minsert \e\ch backward-char
    bind -Minsert \e\cj down-or-search
    bind -Minsert \e\ck up-or-search
    bind -Minsert \e\cl forward-char

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
