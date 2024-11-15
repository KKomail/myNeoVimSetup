-- flutter-tools.nvim: Flutter development tools for Neovim
return {
  "nvim-flutter/flutter-tools.nvim", -- Flutter tools plugin
  lazy = false, -- Load this plugin immediately
  dependencies = {
    "nvim-lua/plenary.nvim", -- Required dependency for utility functions
    "stevearc/dressing.nvim", -- Optional: Enhances vim.ui.select functionality
    "hrsh7th/nvim-cmp", -- Autocompletion
    "hrsh7th/cmp-nvim-lsp", -- LSP source for nvim-cmp
    "L3MON4D3/LuaSnip", -- Snippet engine
  },
  config = function()
    -- Setup flutter-tools
    require("flutter-tools").setup({
      ui = {
        border = "rounded", -- UI border style
        notification_style = "native", -- Notification style for messages
      },
      decorations = {
        statusline = {
          app_version = false, -- Show app version in statusline
          device = true, -- Show device in statusline
          project_config = true, -- Show project configuration in statusline
        },
        debugger = {
          enabled = true, -- Enable debugging features
          run_via_dap = true, -- Use DAP for running Flutter apps
        },
      },
      lsp = {
        on_attach = function(client, bufnr)
          -- Key mappings for LSP
          local opts = { noremap = true, silent = true }
          vim.api.nvim_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts) -- go to definition
          vim.api.nvim_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts) -- go to references
          -- Additional mappings can be added here
        end,
      },
    })

    -- Key mapping to toggle the Flutter dev log
    local api = vim.api
    local function toggle_log()
      local wins = api.nvim_list_wins()
      for _, id in pairs(wins) do
        local bufnr = api.nvim_win_get_buf(id)
        if api.nvim_buf_get_name(bufnr):match(".*/([^/]+)$") == "__FLUTTER_DEV_LOG__" then
          return vim.api.nvim_win_close(id, true)
        end
      end
      pcall(function()
        vim.api.nvim_command("split + __FLUTTER_DEV_LOG__ | resize 15")
      end)
    end

    vim.keymap.set("n", "<leader>fl", toggle_log, { desc = "Toggle Flutter Dev Log" }) -- Key mapping to toggle log window
  end,
}
