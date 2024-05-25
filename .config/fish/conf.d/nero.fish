
# --> special
set -l foreground a9c7d6
set -l selection 414868

# --> palette
set -l red f5596b
set -l blue2 47b2d1
set -l orange fa7a55
set -l green 92cc33
set -l yellow bada55
set -l blue 0da8f2
set -l magenta b291f3
set -l cyan 3df5de
set -l gray 8aa2c0

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
