# Catppuccin color palette

# --> special
set -l foreground c0caf5
set -l selection 414868

# --> palette
set -l red f7768e
set -l blue2 2ac3de
set -l orange ff9e64
set -l green 9ece6a
set -l yellow e0af68
set -l blue 7aa2f7
set -l magenta bb9af7
set -l cyan 7dcfff
set -l gray a9b1d6

# Syntax Highlighting
set -g fish_color_normal $foreground
set -g fish_color_command $blue
set -g fish_color_param $blue2
set -g fish_color_keyword $red
set -g fish_color_quote $green
set -g fish_color_redirection $magenta
set -g fish_color_end $orange
set -g fish_color_error $red
set -g fish_color_gray $gray
set -g fish_color_selection --background=$selection
set -g fish_color_search_match --background=$selection
set -g fish_color_operator $magenta
set -g fish_color_escape $blue2
set -g fish_color_autosuggestion $gray
set -g fish_color_cancel $red

# Prompt
set -g fish_color_cwd $yellow
set -g fish_color_user $cyan
set -g fish_color_host $blue

# Completion Pager
set -g fish_pager_color_progress $gray
set -g fish_pager_color_prefix $magenta
set -g fish_pager_color_completion $foreground
set -g fish_pager_color_description $gray
