# Default Theme
# If changes made here does not take effect, then try to re-create the tmux session to force reload.

if patched_font_in_use; then
	TMUX_POWERLINE_SEPARATOR_LEFT_BOLD=""
	TMUX_POWERLINE_SEPARATOR_LEFT_THIN=""
	TMUX_POWERLINE_SEPARATOR_RIGHT_BOLD=""
	TMUX_POWERLINE_SEPARATOR_RIGHT_THIN=""
	TMUX_POWERLINE_SEPARATOR_LEFT_ROUND=""
	TMUX_POWERLINE_SEPARATOR_RIGHT_ROUND=""
else
	TMUX_POWERLINE_SEPARATOR_LEFT_BOLD="◀"
	TMUX_POWERLINE_SEPARATOR_LEFT_THIN="❮"
	TMUX_POWERLINE_SEPARATOR_RIGHT_BOLD="▶"
	TMUX_POWERLINE_SEPARATOR_RIGHT_THIN="❯"
	TMUX_POWERLINE_SEPARATOR_LEFT_ROUND=""
	TMUX_POWERLINE_SEPARATOR_RIGHT_ROUND=""
fi

THEME="nero"
BLACK1="#0d1c2e"
BLACK2="#12243a"
BLACK3="#1c314a"
BLACK4="#223b58"
RED="#f5596b"
YELLOW="#c8e155"
GREEN="#47b2d1"
BLUE="#0da8f2"
PURPLE="#b291f3"
CYAN="#3df5de"
WHITE="#0da8f2"

TMUX_POWERLINE_DEFAULT_BACKGROUND_COLOR=$BLACK1
TMUX_POWERLINE_DEFAULT_FOREGROUND_COLOR=$WHITE
TMUX_POWERLINE_SEG_AIR_COLOR=$("${TMUX_POWERLINE_DIR_HOME}/segments/air_color.sh")

TMUX_POWERLINE_DEFAULT_LEFTSIDE_SEPARATOR=${TMUX_POWERLINE_DEFAULT_LEFTSIDE_SEPARATOR:-$TMUX_POWERLINE_SEPARATOR_RIGHT_BOLD}
TMUX_POWERLINE_DEFAULT_RIGHTSIDE_SEPARATOR=${TMUX_POWERLINE_DEFAULT_RIGHTSIDE_SEPARATOR:-$TMUX_POWERLINE_SEPARATOR_LEFT_BOLD}

# See man tmux.conf for additional formatting options for the status line.
# The `format regular` and `format inverse` functions are provided as conveniences

if [ -z $TMUX_POWERLINE_WINDOW_STATUS_CURRENT ]; then
	TMUX_POWERLINE_WINDOW_STATUS_CURRENT=(
		"#[$(format regular)]"
		"$TMUX_POWERLINE_SEPARATOR_LEFT_ROUND"
		"#[$(format inverse)]"
		" #I"
		" #W "
		"#[$(format regular)]"
		"$TMUX_POWERLINE_SEPARATOR_RIGHT_ROUND"
	)
fi

if [ -z $TMUX_POWERLINE_WINDOW_STATUS_STYLE ]; then
	TMUX_POWERLINE_WINDOW_STATUS_STYLE=(
		"$(format regular)"
	)
fi

if [ -z $TMUX_POWERLINE_WINDOW_STATUS_FORMAT ]; then
	TMUX_POWERLINE_WINDOW_STATUS_FORMAT=(
		"#[$(format regular)]"
		"  #I#{#F, } "
		" #W "
	)
fi

# Format: segment_name background_color foreground_color [non_default_separator] [separator_background_color] [separator_foreground_color] [spacing_disable] [separator_disable]
#
# * background_color and foreground_color. Formats:
#   * Named colors (chech man page of tmux for complete list) e.g. black, red, green, yellow, blue, magenta, cyan, white
#   * a hexadecimal RGB string e.g. #ffffff
#   * 'default' for the default tmux color.
# * non_default_separator - specify an alternative character for this segment's separator
# * separator_background_color - specify a unique background color for the separator
# * separator_foreground_color - specify a unique foreground color for the separator
# * spacing_disable - remove space on left, right or both sides of the segment:
#   * "left_disable" - disable space on the left
#   * "right_disable" - disable space on the right
#   * "both_disable" - disable spaces on both sides
#   * - any other character/string produces no change to default behavior (eg "none", "X", etc.)
#
# * separator_disable - disables drawing a separator on this segment, very useful for segments
#   with dynamic background colours (eg tmux_mem_cpu_load):
#   * "separator_disable" - disables the separator
#   * - any other character/string produces no change to default behavior
#
# Example segment with separator disabled and right space character disabled:
# "hostname 33 0 {TMUX_POWERLINE_SEPARATOR_RIGHT_BOLD} 33 0 right_disable separator_disable"
#
# Note that although redundant the non_default_separator, separator_background_color and
# separator_foreground_color options must still be specified so that appropriate index
# of options to support the spacing_disable and separator_disable features can be used

if [ -z $TMUX_POWERLINE_LEFT_STATUS_SEGMENTS ]; then
	TMUX_POWERLINE_LEFT_STATUS_SEGMENTS=(
		"tmux_session_info $BLUE $BLACK1"
		"pwd $BLACK4 $BLUE"
		"vcs_branch $BLACK3"
		"vcs_modified $BLACK2 $RED"
		# "hostname $BLACK1 $BLUE" \
		#"ifstat 30 255" \
		#"ifstat_sys 30 255" \
		# "lan_ip 24 255 ${TMUX_POWERLINE_SEPARATOR_RIGHT_THIN}" \
		# "wan_ip $BLACK1 $BLUE"
		#"vcs_compare 60 255" \
		#"vcs_staged 64 255" \
		#"vcs_others 245 0" \
	)
fi

if [ -z $TMUX_POWERLINE_RIGHT_STATUS_SEGMENTS ]; then
	TMUX_POWERLINE_RIGHT_STATUS_SEGMENTS=(
		"now_playing $BLACK2 $PURPLE"
		"battery $BLACK3 $CYAN"
		"time $BLUE $BLACK1 "
		#"time $BLUE $BLACK1 ${TMUX_POWERLINE_SEPARATOR_LEFT_THIN}"
		#"mailcount 9 255" \
		#"earthquake 3 0" \
		#"macos_notification_count 29 255" \
		#"cpu 240 136" \
		# "load 237 167" \
		#"tmux_mem_cpu_load 234 136" \
		#"air ${TMUX_POWERLINE_SEG_AIR_COLOR} 255" \
		#"weather 37 255" \
		#"rainbarf 0 ${TMUX_POWERLINE_DEFAULT_FOREGROUND_COLOR}" \
		#"xkb_layout 125 117" \
		#"date_day $BLUE $BLACK1"
		#"utc_time 235 136 ${TMUX_POWERLINE_SEPARATOR_LEFT_THIN}" \
	)
fi
