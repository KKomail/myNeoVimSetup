-- Telescope.nvim: A fuzzy finder for Neovim with Flutter integration
return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" }, -- Ensure plenary is included as a dependency
    keys = {
      {
        "<leader>fp",
        function()
          require("telescope.builtin").find_files({ cwd = require("lazy.core.config").options.root })
        end,
        desc = "Find Plugin File",
      },
      {
        "<leader>f",
        "<cmd>Telescope flutter commands<CR>",
        desc = "Flutter Commands", -- Keymap for accessing Flutter commands via Telescope
      },
    },
    opts = {
      defaults = {
        layout_strategy = "horizontal",
        layout_config = { prompt_position = "top" },
        sorting_strategy = "ascending",
        winblend = 0,
      },
    },
    config = function(_, opts)
      -- Setup Telescope with the provided options
      require("telescope").setup(opts) -- Pass the options to Telescope setup

      -- Load the Flutter extension for Telescope
      require("telescope").load_extension("flutter")

      -- Additional key mappings can be set here if needed
    end,
  },
}
