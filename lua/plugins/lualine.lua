-- lualine.nvim: A fast and easy-to-configure statusline plugin for Neovim
return {
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy", -- Load this plugin when idle (very lazy loading)
    opts = function(_, opts)
      table.insert(opts.sections.lualine_x, {
        function()
          return "😄"
        end,
      }) -- Add a custom component to the statusline
    end,
  },
}
