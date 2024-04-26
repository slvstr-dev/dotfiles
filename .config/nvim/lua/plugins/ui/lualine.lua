return {
  {
    "nvim-lualine/lualine.nvim",
    opts = function()
      return {
        options = {
          component_separators = { left = ' ', right = ' ' },
          section_separators = { left = ' ', right = ' ' },
        }
      }
    end
  },
}
