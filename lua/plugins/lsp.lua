return {
  -- Neovim LSP Configuration
  {
    "neovim/nvim-lspconfig",
    config = function()
      -- Setup LSP for Dart
      require("lspconfig").dartls.setup({
        cmd = { "dart", "path_to_your_dart_sdk/bin/snapshots/analysis_server.dart.snapshot", "--lsp" },
        on_attach = function(client, bufnr)
          -- Key mappings for LSP ??
          local opts = { noremap = true, silent = true }
          vim.api.nvim_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
          vim.api.nvim_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
          -- Additional key mappings as needed
        end,
      })

      -- Setup nvim-cmp
      local cmp = require("cmp")
      cmp.setup({
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body) -- For luasnip users
          end,
        },
        mapping = {
          ["<C-n>"] = cmp.mapping.select_next_item(),
          ["<C-p>"] = cmp.mapping.select_prev_item(),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
        },
        sources = {
          { name = "nvim_lsp" },
          { name = "buffer" },
          { name = "path" },
        },
      })
    end,
  },

  -- Additional LSP configurations
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        pyright = {}, -- Python support
        tsserver = {}, -- TypeScript support
        -- not sure about this swift lsp (cld work)
        sourcekit = { -- Swift support
          cmd = { "xcrun", "sourcekit-lsp" }, -- Command to start sourcekit-lsp
          filetypes = { "swift" }, -- File types supported by sourcekit-lsp
          root_dir = function(fname)
            return require("lspconfig.util").find_git_ancestor(fname) or vim.loop.os_homedir()
          end,
        },
      },
    },
  },

  -- TypeScript server configuration with additional setup using typescript.nvim
  -- something i am doing wrong here I swear
  {
    "neovim/nvim-lspconfig",
    dependencies = { "jose-elias-alvarez/typescript.nvim" },
    config = function()
      require("typescript").setup({
        server = {
          on_attach = function(_, opts)
            return true
          end,
        },
      })
    end,
  },
}
