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

return config
