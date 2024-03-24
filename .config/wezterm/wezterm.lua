local wezterm = require("wezterm")
local config = wezterm.config_builder()

-- Font settings
config.font = wezterm.font "CaskaydiaCove Nerd Font"
config.font_size = 16
config.line_height = 1.4
config.command_palette_font_size = 16

-- Color scheme
config.color_scheme = "Catppuccin Mocha"

-- Window appearance
config.macos_window_background_blur = 40
config.window_background_opacity = 0.8
config.window_decorations = "RESIZE"

-- Key bindings
config.keys = require("keys")

-- Plugin configuration
wezterm.plugin.require("https://github.com/nekowinston/wezterm-bar").apply_to_config(config, {
  position = "top",
  indicator = {
    leader = {
      enabled = false,
    },
  },
})

return config
