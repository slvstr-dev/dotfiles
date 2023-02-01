---@type LazyPluginSpec[]
local M = {
 {    
    'EdenEast/nightfox.nvim',
    lazy = false,
    config = function()
      require("nightfox").load()

      vim.cmd("colorscheme duskfox")
    end,
  }
}

return M
