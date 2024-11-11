-- nvim-cmp: A completion plugin for Neovim
return {
  {
    "hrsh7th/nvim-cmp",
    dependencies = { "hrsh7th/cmp-emoji" }, -- Emoji completion source
    opts = function(_, opts)
      table.insert(opts.sources, { name = "emoji" }) -- Add emoji to completion sources
    end,
  },
}
