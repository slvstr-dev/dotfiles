return {
  { "lbrayner/vim-rzip" },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        vtsls = {
          before_init = function(_, config)
            local tsdk = config.root_dir and config.root_dir .. "/.yarn/sdks/typescript/lib"
            if tsdk and vim.uv.fs_stat(tsdk) then
              config.settings.typescript = config.settings.typescript or {}
              config.settings.typescript.tsdk = tsdk
            end
          end,
        },
        eslint = {
          settings = { nodePath = ".yarn/sdks" },
        },
      },
    },
  },
  {
    "stevearc/conform.nvim",
    opts = {
      formatters = {
        prettier = {
          command = function(self, ctx)
            local root = vim.fs.root(ctx.filename, ".pnp.cjs")
            local sdk = root and root .. "/.yarn/sdks/prettier/bin/prettier.cjs"
            if sdk and vim.fn.executable(sdk) == 1 then
              return sdk
            end
            return require("conform.util").from_node_modules("prettier")(self, ctx)
          end,
        },
      },
    },
  },
}
