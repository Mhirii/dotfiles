local colors = {
	foreground = "#e0def4",
	background = "#191724",
	cursor_bg = "#e0def4",
	cursor_border = "#e0def4",
	cursor_fg = "#0f1d2e",
	selection_bg = "#2a283e",
	selection_fg = "#e0def4",
	split = "#31748f",
	compose_cursor = "#f6c177",

	ansi = {
		"#191724",
		"#eb6f92",
		"#f6c177",
		"#ebbcba",
		"#31748f",
		"#c4a7e7",
		"#9ccfd8",
		"#908caa",
	},
	brights = {
		"#393552",
		"#eb6f92",
		"#f6c177",
		"#ea9a97",
		"#3e8fb0",
		"#9ccfd8",
		"#c4a7e7",
		"#908caa",
	},

	tab_bar = {
		inactive_tab_edge = "#0f1d2e",
		background = "#191724",
		active_tab = {
			fg_color = "#31748f",
			bg_color = "#191724",
		},
		inactive_tab = {
			fg_color = "#393552",
			bg_color = "#1a1b26",
		},
		inactive_tab_hover = {
			fg_color = "#31748f",
			bg_color = "#393552",
		},
		new_tab_hover = {
			fg_color = "#31748f",
			bg_color = "#191724",
			intensity = "Bold",
		},
		new_tab = {
			fg_color = "#7aa2f7",
			bg_color = "#1a1b26",
		},
	},
}
return colors
