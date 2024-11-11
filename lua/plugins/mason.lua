-- mason.nvim: Package manager for managing external editor tooling (like LSP servers)
return {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "stylua", -- Lua formatter
        "shellcheck", -- Shell script linter
        "shfmt", -- Shell script formatter
        "flake8", -- Python linter
      }, -- Ensure these tools are installed via Mason
    },
  },
}
