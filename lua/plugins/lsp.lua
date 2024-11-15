-- LSP configuration for Neovim
return {
  "neovim/nvim-lspconfig", -- LSP configuration
  config = function()
    -- Setup LSP for Dart
    require("lspconfig").dartls.setup({
      cmd = { "dart", "path_to_your_dart_sdk/bin/snapshots/analysis_server.dart.snapshot", "--lsp" },
      on_attach = function(client, bufnr)
        -- Key mappings for LSP
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
}
