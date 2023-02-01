---@type LazyPluginSpec[]
local M = {
  -- catppuccin
  {
    "catppuccin/nvim",
    name = "catppuccin",
    opts = { flavour = "mocha" },
    config = function(_, opts)
      require("catppuccin").setup(opts)
      require("catppuccin").load(opts.flavour)
    end,
    priority = 1000,
  },
}

return M
