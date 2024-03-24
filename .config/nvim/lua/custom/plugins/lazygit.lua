return {
  "kdheepak/lazygit.nvim",
  -- optional for floating window border decoration
  dependencies = {
      "nvim-lua/plenary.nvim"
  },
  cmd = {
    "LazyGit",
    "LazyGitConfig",
    "LazyGitCurrentFile",
    "LazyGitFilter",
    "LazyGitFilterCurrentFile"
  }
}
-- vim: ts=2 sts=2 sw=2 et