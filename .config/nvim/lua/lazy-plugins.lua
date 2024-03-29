-- [[ Configure and install plugins ]]
--
--  To check the current status of your plugins, run
--    :Lazy
--
--  You can press `?` in this menu for help. Use `:q` to close the window
--
--  To update plugins, you can run
--    :Lazy update
--
-- NOTE: Here is where you install your plugins.
require('lazy').setup {
  require 'config/plugins/vim-sleuth',

  require 'config/plugins/comment',

  require 'config/plugins/gitsigns',

  require 'config/plugins/which-key',

  require 'config/plugins/telescope',

  require 'config/plugins/lspconfig',

  require 'config/plugins/conform',

  require 'config/plugins/cmp',

  require 'config/plugins/catppuccin',

  require 'config/plugins/todo-comments',

  require 'config/plugins/mini',

  require 'config/plugins/treesitter',

  require 'config.plugins.debug',

  require 'config.plugins.indent-line',

  require 'config.plugins.lint',

  require 'config.plugins.dashboard-nvim',

  -- NOTE: The import below can automatically add your own plugins, configuration, etc from `lua/custom/plugins/*.lua`
  --    This is the easiest way to modularize your config.
  --
  --  Uncomment the following line and add your plugins to `lua/custom/plugins/*.lua` to get going.
  --    For additional information, see `:help lazy.nvim-lazy.nvim-structuring-your-plugins`
  { import = 'custom.plugins' },
}

-- vim: ts=2 sts=2 sw=2 et