-- nvim-treesitter: Treesitter configurations and abstraction layer for Neovim
return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "bash",
        "html",
        "javascript",
        "lua",
        "python",
        "typescript",
        "yaml",
      }, -- Ensure these parsers are installed
    },
  },
}
