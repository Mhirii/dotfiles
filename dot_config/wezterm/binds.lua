local wezterm = require("wezterm")
local act = wezterm.action
local M = {}

M.leader = { key = "a", mods = "ALT", timeout_milliseconds = 1000 }
M.keys = {

  -- ── Defaults ─────────────────────────────────{
  { key = ")",          mods = "SHIFT|CTRL",     action = act.ResetFontSize },
  { key = "P",          mods = "SHIFT|CTRL",     action = act.ActivateCommandPalette },
  { key = "R",          mods = "SHIFT|CTRL",     action = act.ReloadConfiguration },
  { key = "LeftArrow",  mods = "SHIFT|CTRL",     action = act.ActivatePaneDirection("Left") },
  { key = "RightArrow", mods = "SHIFT|CTRL",     action = act.ActivatePaneDirection("Right") },
  { key = "UpArrow",    mods = "SHIFT|CTRL",     action = act.ActivatePaneDirection("Up") },
  { key = "DownArrow",  mods = "SHIFT|CTRL",     action = act.ActivatePaneDirection("Down") },
  --}

  -- ── Copy Paste ───────────────────────────────{
  { key = "F",          mods = "SHIFT|CTRL",     action = act.Search("CurrentSelectionOrEmptyString") },
  { key = "X",          mods = "CTRL",           action = act.ActivateCopyMode },
  { key = "v",          mods = "LEADER",         action = act.ActivateCopyMode },
  { key = "s",          mods = "LEADER",         action = act.QuickSelect },
  { key = "s",          mods = "SHIFT|CTRL|ALT", action = act.QuickSelect },
  { key = "c",          mods = "SHIFT|CTRL",     action = act.CopyTo("Clipboard") },
  { key = "V",          mods = "SHIFT|CTRL",     action = act.PasteFrom("Clipboard") },
  { key = "Insert",     mods = "SHIFT",          action = act.PasteFrom("PrimarySelection") },
  { key = "Copy",       mods = "NONE",           action = act.CopyTo("Clipboard") },
  { key = "Paste",      mods = "NONE",           action = act.PasteFrom("Clipboard") },
  -- }

  -- ── Scroll ───────────────────────────────────{
  { key = "k",          mods = "SHIFT|CTRL",     action = act.ScrollByLine(-1) },
  { key = "j",          mods = "SHIFT|CTRL",     action = act.ScrollByLine(1) },
  { key = "UpArrow",    mods = "SHIFT",          action = act.ScrollByLine(-1) },
  { key = "DownArrow",  mods = "SHIFT",          action = act.ScrollByLine(1) },
  { key = "u",          mods = "SHIFT|CTRL",     action = act.ScrollByPage(-1) },
  { key = "d",          mods = "SHIFT|CTRL",     action = act.ScrollByPage(1) },
  { key = "PageUp",     mods = "SHIFT",          action = act.ScrollByPage(-1) },
  { key = "PageDown",   mods = "SHIFT",          action = act.ScrollByPage(1) },
  { key = "}",          mods = "SHIFT|CTRL",     action = act.ScrollToPrompt(1) }, -- FIXME: Does not work
  { key = "{",          mods = "SHIFT|CTRL",     action = act.ScrollToPrompt(-1) }, -- FIXME: Does not work

  -- }

  -- ── Tabs ─────────────────────────────────────{
  { key = "T",          mods = "SHIFT|CTRL",     action = act.SpawnTab("CurrentPaneDomain") },
  { key = "c",          mods = "LEADER",         action = act.SpawnTab("CurrentPaneDomain") },
  { key = "W",          mods = "SHIFT|CTRL",     action = act.CloseCurrentTab({ confirm = true }) },
  { key = "x",          mods = "LEADER",         action = act.CloseCurrentTab({ confirm = true }) },
  { key = "H",          mods = "SHIFT|CTRL",     action = act.ActivateTabRelative(-1) },
  { key = "PageUp",     mods = "CTRL",           action = act.ActivateTabRelative(-1) },
  { key = "L",          mods = "SHIFT|CTRL",     action = act.ActivateTabRelative(1) },
  { key = "PageDown",   mods = "CTRL",           action = act.ActivateTabRelative(1) },
  { key = "H",          mods = "SHIFT|CTRL|ALT", action = act.MoveTabRelative(-1) },
  { key = "PageUp",     mods = "SHIFT|CTRL",     action = act.MoveTabRelative(-1) },
  { key = "{",          mods = "SHIFT|CTRL|ALT", action = act.MoveTabRelative(-1) },
  { key = "L",          mods = "SHIFT|CTRL|ALT", action = act.MoveTabRelative(1) },
  { key = "PageDown",   mods = "SHIFT|CTRL",     action = act.MoveTabRelative(1) },
  { key = "}",          mods = "SHIFT|CTRL|ALT", action = act.MoveTabRelative(1) },
  { key = "1",          mods = "ALT",            action = act.ActivateTab(0) },
  { key = "2",          mods = "ALT",            action = act.ActivateTab(1) },
  { key = "3",          mods = "ALT",            action = act.ActivateTab(2) },
  { key = "4",          mods = "ALT",            action = act.ActivateTab(3) },
  { key = "5",          mods = "ALT",            action = act.ActivateTab(4) },
  { key = "6",          mods = "ALT",            action = act.ActivateTab(5) },
  { key = "7",          mods = "ALT",            action = act.ActivateTab(6) },
  { key = "8",          mods = "ALT",            action = act.ActivateTab(7) },
  { key = "9",          mods = "ALT",            action = act.ActivateTab(-1) },
  --}

  -- ── Panes ────────────────────────────────────{
  {
    key = "|",
    mods = "LEADER|SHIFT",
    action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
  },
  {
    key = "-",
    mods = "LEADER",
    action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
  },
  { key = "h",          mods = "ALT|CTRL",       action = act.ActivatePaneDirection("Left") },
  { key = "l",          mods = "ALT|CTRL",       action = act.ActivatePaneDirection("Right") },
  { key = "k",          mods = "ALT|CTRL",       action = act.ActivatePaneDirection("Up") },
  { key = "j",          mods = "ALT|CTRL",       action = act.ActivatePaneDirection("Down") },
  { key = "UpArrow",    mods = "SHIFT|ALT|CTRL", action = act.AdjustPaneSize({ "Up", 1 }) },
  { key = "DownArrow",  mods = "SHIFT|ALT|CTRL", action = act.AdjustPaneSize({ "Down", 1 }) },
  { key = "RightArrow", mods = "SHIFT|ALT|CTRL", action = act.AdjustPaneSize({ "Right", 1 }) },
  { key = "LeftArrow",  mods = "SHIFT|ALT|CTRL", action = act.AdjustPaneSize({ "Left", 1 }) },
  -- }

  -- ── misc ─────────────────────────────────────{
  {
    key = "u",
    mods = "LEADER",
    action = act.CharSelect({ copy_on_select = true, copy_to = "ClipboardAndPrimarySelection" }),
  },
  { key = "r", mods = "LEADER",       action = wezterm.action.ShowLauncher },
  { key = "U", mods = "LEADER|SHIFT", action = wezterm.action.CharSelect },

  -- }
}

M.deleted = {
  { key = '"',   mods = "ALT|CTRL",       action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },
  { key = '"',   mods = "SHIFT|ALT|CTRL", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },
  { key = "%",   mods = "ALT|CTRL",       action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
  { key = "5",   mods = "SHIFT|ALT|CTRL", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
  { key = "%",   mods = "SHIFT|ALT|CTRL", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
  { key = "'",   mods = "SHIFT|ALT|CTRL", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },
  { key = "!",   mods = "CTRL",           action = act.ActivateTab(0) },
  { key = "@",   mods = "CTRL",           action = act.ActivateTab(1) },
  { key = "!",   mods = "SHIFT|CTRL",     action = act.ActivateTab(0) },
  { key = "@",   mods = "SHIFT|CTRL",     action = act.ActivateTab(1) },
  { key = "#",   mods = "CTRL",           action = act.ActivateTab(2) },
  { key = "#",   mods = "SHIFT|CTRL",     action = act.ActivateTab(2) },
  { key = "$",   mods = "CTRL",           action = act.ActivateTab(3) },
  { key = "$",   mods = "SHIFT|CTRL",     action = act.ActivateTab(3) },
  { key = "%",   mods = "CTRL",           action = act.ActivateTab(4) },
  { key = "%",   mods = "SHIFT|CTRL",     action = act.ActivateTab(4) },
  { key = "&",   mods = "CTRL",           action = act.ActivateTab(6) },
  { key = "&",   mods = "SHIFT|CTRL",     action = act.ActivateTab(6) },
  { key = "*",   mods = "CTRL",           action = act.ActivateTab(7) },
  { key = "*",   mods = "SHIFT|CTRL",     action = act.ActivateTab(7) },
  { key = "Tab", mods = "CTRL",           action = act.ActivateTabRelative(1) },
  { key = "Tab", mods = "SHIFT|CTRL",     action = act.ActivateTabRelative(-1) },
  { key = "-",   mods = "SHIFT|CTRL",     action = act.DecreaseFontSize },
  { key = "+",   mods = "SHIFT|CTRL",     action = act.IncreaseFontSize },
  { key = "z",   mods = "SHIFT|CTRL",     action = act.TogglePaneZoomState },
  --
  { key = "l",   mods = "SHIFT|CTRL",     action = act.ShowDebugOverlay },
  { key = "L",   mods = "CTRL",           action = act.ShowDebugOverlay },
  { key = "L",   mods = "SHIFT|CTRL",     action = act.ShowDebugOverlay },
  { key = "Z",   mods = "SHIFT|CTRL",     action = act.TogglePaneZoomState },
  -- { key = "{", mods = "SUPER", action = act.ActivateTabRelative(-1) },
  -- { key = "{", mods = "SHIFT|SUPER", action = act.ActivateTabRelative(-1) },
  -- { key = "}", mods = "SUPER", action = act.ActivateTabRelative(1) },
  -- { key = "}", mods = "SHIFT|SUPER", action = act.ActivateTabRelative(1) },
  -- { key = "phys:Space", mods = "SHIFT|CTRL", action = act.QuickSelect },
}

return M
