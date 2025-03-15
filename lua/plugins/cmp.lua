-- plugins/cmp.lua
return {
  {
    "hrsh7th/nvim-cmp",
    enabled = true,
    dependencies = {
      "hrsh7th/cmp-nvim-lsp", -- LSP source for completion
      "hrsh7th/cmp-emoji", -- Emoji completion source
      "hrsh7th/cmp-buffer", -- Buffer completion source
      "hrsh7th/cmp-path", -- Path completion source
    },
    config = function()
      local cmp = require("cmp")

      cmp.setup({
        snippet = {
          expand = function(args)
            vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users, if you use another snippet engine, replace this
          end,
        },
        mapping = {
          -- Ctrl b -> scroll up in documentation window
          ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
          -- Ctrl f -> scroll down
          ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
          -- Ctrl Space -> open complettion menu
          ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
          ["<C-y>"] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
          ["<C-e>"] = cmp.mapping({
            i = cmp.mapping.abort(),
            c = cmp.mapping.close(),
          }),
          ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        },
        sources = cmp.config.sources({
          { name = "nvim_lsp" }, -- LSP source
          { name = "emoji" }, -- Emoji source
          { name = "buffer" }, -- Buffer source
          { name = "path" }, -- Path source
        }),
      })
    end,
  },
}
