return {
  "nvimdev/dashboard-nvim",
  event = "VimEnter",
  config = function()
    local logo = [[

       /\\\\\_____/\\\_______________________________/\\\________/\\\___________________________
       \/\\\\\\___\/\\\______________________________\/\\\_______\/\\\__________________________
       _\/\\\/\\\__\/\\\______________________________\//\\\______/\\\___/\\\_____________________
        _\/\\\//\\\_\/\\\_____/\\\\\\\\______/\\\\\_____\//\\\____/\\\___\///_____/\\\\\__/\\\\\__
         _\/\\\\//\\\\/\\\___/\\\/////\\\___/\\\///\\\____\//\\\__/\\\_____/\\\__/\\\///\\\\\///\\\_
          _\/\\\_\//\\\/\\\__/\\\\\\\\\\\___/\\\__\//\\\____\//\\\/\\\_____\/\\\_\/\\\_\//\\\__\/\\\
           _\/\\\__\//\\\\\\_\//\\///////___\//\\\__/\\\______\//\\\\\______\/\\\_\/\\\__\/\\\__\/\\\_
            _\/\\\___\//\\\\\__\//\\\\\\\\\\__\///\\\\\/________\//\\\_______\/\\\_\/\\\__\/\\\__\/\\\
             _\///_____\/////____\//////////_____\/////___________\///________\///__\///___\///___\///__

    ]]

    logo = string.rep("\n", 8) .. logo .. "\n\n"

    local center = {
      {
        desc = "Find File                     ",
        keymap = "",
        key = "f",
        icon = "  ",
        action = "Telescope find_files",
      },
      {
        desc = "Recents",
        keymap = "",
        key = "r",
        icon = "  ",
        action = "Telescope oldfiles",
      },
      {
        desc = "Update Plugins",
        keymap = "",
        key = "u",
        icon = "  ",
        action = "Lazy update",
      },
      {
        desc = "Config",
        keymap = "",
        key = "s",
        icon = "  ",
        action = "Telescope find_files cwd=~/.config/nvim",
      },
      {
        desc = "Exit",
        keymap = "",
        key = "q",
        icon = "  ",
        action = "exit",
      },
    }

    require("dashboard").setup {
      theme = "doom",
      config = {
        header = vim.split(logo, "\n"),
        center = center,
        footer = {}
      },
    }
  end,
  dependencies = { { "nvim-tree/nvim-web-devicons" } }
}
