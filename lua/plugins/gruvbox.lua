-- Gruvbox color scheme for Neovim
return {
  { "ellisonleao/gruvbox.nvim" },

  -- Configure LazyVim to use the Gruvbox color scheme
  {
    "LazyVim/LazyVim",
    opts = { colorscheme = "gruvbox" },
  },
}
