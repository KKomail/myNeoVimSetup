-- custom colour scheme
-- catppuccin_setup.lua
return {
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = function()
        require("catppuccin").load()
      end,
    },
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = {
      no_italic = true,
      term_colors = true,
      transparent_background = false,
      styles = {
        comments = {},
        conditionals = {},
        loops = {},
        functions = {},
        keywords = {},
        strings = {},
        variables = {},
        numbers = {},
        booleans = {},
        properties = {},
        types = {},
      },
      color_overrides = {
        mocha = { --latte, frappe, mocha, -macchiato
          --base = "#000000",
          --mantle = "#000000",
          --crust = "#000000"
          text = "#F4CDE9",
          subtext1 = "#DEBAD4",
          subtext0 = "#C8A6BE",
          overlay2 = "#B293A8",
          overlay1 = "#9C7F92",
          overlay0 = "#866C7D",
          surface2 = "#705867",
          surface1 = "#5A4551",
          surface0 = "#44313B",

          --base = "#352939",
          base = "#331E38",
          mantle = "#211924",
          crust = "#1a1016",
        },
      },
      integrations = {
        ts_rainbow = true,
        telescope = {
          enabled = true,
          style = "nvchad",
        },
        dropbar = {
          enabled = true,
          color_mode = true,
        },
      },
    },
  },
}
