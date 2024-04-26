local wezterm = require("wezterm")
local action = wezterm.action

local M = {
  -- Tabs
  { key = "h", mods = "SHIFT|CMD",  action = action.ActivateTabRelative(-1) },
  { key = "j", mods = "SHIFT|CMD",  action = action.SpawnTab 'CurrentPaneDomain' },
  { key = "k", mods = "SHIFT|CMD",  action = action.CloseCurrentTab { confirm = true } },
  { key = "l", mods = "SHIFT|CMD",  action = action.ActivateTabRelative(1) },

  -- Panes
  { key = "h", mods = "SHIFT|ALT",  action = action.SplitPane({ direction = "Left" }) },
  { key = "j", mods = "SHIFT|ALT",  action = action.SplitPane({ direction = "Down" }) },
  { key = "k", mods = "SHIFT|ALT",  action = action.SplitPane({ direction = "Up" }) },
  { key = "l", mods = "SHIFT|ALT",  action = action.SplitPane({ direction = "Right" }) },
  { key = "h", mods = "SHIFT|ALT",  action = action.SplitPane({ direction = "Left" }) },
  { key = "q", mods = "SHIFT|ALT",  action = action.CloseCurrentPane({ confirm = true }) },
  { key = "h", mods = "SHIFT|CTRL", action = action.ActivatePaneDirection "Left" },
  { key = "j", mods = "SHIFT|CTRL", action = action.ActivatePaneDirection "Down" },
  { key = "k", mods = "SHIFT|CTRL", action = action.ActivatePaneDirection "Up" },
  { key = "l", mods = "SHIFT|CTRL", action = action.ActivatePaneDirection "Right" },
}

return M
