-- nvim-lspconfig: Quickstart configurations for Language Server Protocol (LSP)
return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = { pyright = {} }, -- Configure Pyright for Python support
    },
  },

  -- TypeScript server configuration with additional setup using typescript.nvim
  {
    "neovim/nvim-lspconfig",
    dependencies = { "jose-elias-alvarez/typescript.nvim" }, -- TypeScript support
    opts = {
      servers = { tsserver = {} }, -- Configure TypeScript server
      setup = {
        tsserver = function(_, opts)
          require("typescript").setup({ server = opts }) -- Setup TypeScript server with additional options
          return true
        end,
      },
    },
  },

  -- Import LazyVim's TypeScript extras for additional configurations and setups
  { import = "lazyvim.plugins.extras.lang.typescript" },
}
