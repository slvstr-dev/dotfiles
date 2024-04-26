local wezterm = require("wezterm")
local config = wezterm.config_builder()

-- Font settings
config.font = wezterm.font "CaskaydiaCove Nerd Font"
config.font_size = 16
config.line_height = 1.2
config.command_palette_font_size = 16

-- Color scheme
config.color_scheme = "Catppuccin Mocha"

-- Window appearance
config.window_decorations = "RESIZE"

-- Tab bar appearance
config.use_fancy_tab_bar = false
config.colors = {
  tab_bar = {
    background = "rgb(30, 30, 46)",
  }
}

-- Key bindings
config.keys = require("keys")

return config
