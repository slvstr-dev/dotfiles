return {
  {
    "zbirenbaum/copilot.lua",
    config = function()
      require("copilot").setup {
        model = "gpt-5.1"
      }
    end,
  },
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    config = function()
      require("CopilotChat").setup {
        model = "gpt-5.1"
      }
    end,
  }
}
