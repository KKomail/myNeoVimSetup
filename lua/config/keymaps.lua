-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Key mappings for Flutter commands using Telescope and other features

-- Open Flutter commands using Telescope with <leader>r
vim.keymap.set("n", "<leader>r", require("telescope").extensions.flutter.commands, { desc = "Open Flutter Commands" })

-- Other useful key mappings can be added here as needed:
-- Example: Open widget tree actions (replace with actual command if different)
vim.keymap.set("n", "<leader>ca", "<cmd>FlutterOutline<CR>", { desc = "Open Widget Tree" })
