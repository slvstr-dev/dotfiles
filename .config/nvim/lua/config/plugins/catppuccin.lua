return {
  -- You can easily change to a different colorscheme.
  -- Change the name of the colorscheme plugin below, and then
  -- change the command in the config to whatever the name of that colorscheme is
  --
  -- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`
  'catppuccin/nvim',
  lazy = false, -- make sure we load this during startup if it is your main colorscheme
  priority = 1000, -- make sure to load this before all the other start plugins
  init = function()
    require("catppuccin").setup {
      transparent_background = true,
      custom_highlights = function(colors)
        return {
          DashboardShortCut = { fg = colors.green },
          DashboardHeader = { fg = colors.green },
          DashboardCenter = { fg = colors.green },
          DashboardFooter = { fg = colors.green, style = { "italic" } },
          DashboardMruTitle = { fg = colors.green },
          DashboardProjectTitle = { fg = colors.green },
          DashboardFiles = { fg = colors.green },
          DashboardKey = { fg = colors.yellow },
          DashboardDesc = { fg = colors.text },
          DashboardIcon = { fg = colors.text, bold = true },
        }
      end
    }

    -- Load the colorscheme here.
    vim.cmd.colorscheme 'catppuccin-mocha'
    
    -- You can configure highlights by doing something like
    vim.cmd.hi 'Comment gui=none'
  end,
}

-- vim: ts=2 sts=2 sw=2 et