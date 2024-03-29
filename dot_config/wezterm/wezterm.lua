local wezterm = require("wezterm")

local config = {}
if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- ── Binds ────────────────────────────────────
config.disable_default_key_bindings = true
local binds = require("binds")
config.leader = binds.leader
config.keys = binds.keys

-- ── UI ───────────────────────────────────────
local ui = require("ui")
for key, value in pairs(ui) do
	config[key] = value
end

-- local smart_splits = wezterm.plugin.require("https://github.com/mrjones2014/smart-splits.nvim")
-- smart_splits.apply_to_config(config, {
--   direction_keys = { "h", "j", "k", "l" },
--   modifiers = {
--     move = "CTRL", -- modifier to use for pane movement, e.g. CTRL+h to move left
--     resize = "ALT", -- modifier to use for pane resize, e.g. META+h to resize to the left
--   },
-- })

-- ── Hyprlinks ────────────────────────────────
config.hyperlink_rules = wezterm.default_hyperlink_rules()

-- make username/project paths clickable. this implies paths like the following are for github.
-- ( "nvim-treesitter/nvim-treesitter" | wbthomason/packer.nvim | wez/wezterm | "wez/wezterm.git" )
-- as long as a full url hyperlink regex exists above this it should not match a full url to
-- github or gitlab / bitbucket (i.e. https://gitlab.com/user/project.git is still a whole clickable url)
table.insert(config.hyperlink_rules, {
	regex = [[["]?([\w\d]{1}[-\w\d]+)(/){1}([-\w\d\.]+)["]?]],
	format = "https://www.github.com/$1/$3",
})

config.check_for_updates = false
config.check_for_updates_interval_seconds = 86400

return config
