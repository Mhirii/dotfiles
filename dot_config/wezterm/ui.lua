local wezterm = require("wezterm")

local M = {}

M.use_fancy_tab_bar = true
M.hide_tab_bar_if_only_one_tab = true
M.tab_bar_at_bottom = true
M.window_frame = {
	font = wezterm.font({ family = "Roboto", weight = "Bold" }),
	font_size = 10.0,
	active_titlebar_bg = "#1a1b26",
	inactive_titlebar_bg = "#1a1b26",
}

M.font = wezterm.font({
	family = "MonaspiceNe Nerd Font",
	harfbuzz_features = { "ss01", "ss02", "ss03", "ss05", "ss06", "ss07", "ss08", "calt", "dlig" },
	weight = "Medium",
	italic = false,
})
M.font_size = 12.0

M.window_background_opacity = 0.9
M.color_schemes = require("themes")
M.color_scheme = "tokyoNight"
return M
