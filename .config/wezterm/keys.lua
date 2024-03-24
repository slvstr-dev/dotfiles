local wezterm = require("wezterm")
local action = wezterm.action

local M = {
  -- Tabs
  { key = "h", mods = "CMD", action = action.ActivateTabRelative(-1) },
  { key = "j", mods = "CMD", action = action.SpawnTab 'CurrentPaneDomain' },
  { key = "k", mods = "CMD", action = action.CloseCurrentTab { confirm = true } },
  { key = "l", mods = "CMD", action = action.ActivateTabRelative(1) },
  
  -- Panes
  { key = "h", mods = "ALT", action = action.SplitPane({ direction = "Left" }) },
  { key = "j", mods = "ALT", action = action.SplitPane({ direction = "Down" }) },
  { key = "k", mods = "ALT", action = action.SplitPane({ direction = "Up" }) },
  { key = "l", mods = "ALT", action = action.SplitPane({ direction = "Right" }) },
  { key = "h", mods = "ALT", action = action.SplitPane({ direction = "Left" }) },
  { key = "q", mods = "ALT", action = action.CloseCurrentPane({ confirm = true }) },
  { key = "h", mods = "CTRL", action = action.ActivatePaneDirection "Left" },
  { key = "j", mods = "CTRL", action = action.ActivatePaneDirection "Down"  },
  { key = "k", mods = "CTRL", action = action.ActivatePaneDirection "Up" },
  { key = "l", mods = "CTRL", action = action.ActivatePaneDirection "Right" },
}
  
return M