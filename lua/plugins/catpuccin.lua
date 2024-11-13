-- catppuccin_setup.lua
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  spec = {
    -- Install Catppuccin color scheme
    { "catppuccin/nvim", name = "catppuccin" },
  },
  defaults = {
    lazy = false, -- Load all plugins at startup
    version = false, -- Use the latest version
  },
  install = { colorscheme = { "catppuccin" } },
})

-- Set Catppuccin as the default color scheme
vim.cmd("colorscheme catppuccin")
