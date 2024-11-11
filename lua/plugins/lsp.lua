-- nvim-lspconfig: Quickstart configurations for Language Server Protocol (LSP)
return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        pyright = {}, -- Python support
        tsserver = {}, -- TypeScript support
        sourcekit = { -- Swift support
          cmd = { "xcrun", "sourcekit-lsp" }, -- Use xcrun to find sourcekit-lsp
          filetypes = { "swift" },
          root_dir = function(fname)
            return require("lspconfig.util").find_git_ancestor(fname) or vim.loop.os_homedir()
          end,
        },
      },
    },
  },

  -- TypeScript server configuration with additional setup using typescript.nvim
  {
    "neovim/nvim-lspconfig",
    dependencies = { "jose-elias-alvarez/typescript.nvim" },
    opts = {
      servers = { tsserver = {} },
      setup = {
        tsserver = function(_, opts)
          require("typescript").setup({ server = opts })
          return true
        end,
      },
    },
  },

  -- Import LazyVim's TypeScript extras for additional configurations and setups
  { import = "lazyvim.plugins.extras.lang.typescript" },
}
