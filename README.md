# 💤 myLazyVim

## My Personal Setup for NeoVim

Refer to the [documentation](https://lazyvim.github.io/installation) to get started (or just clone mine).

### Extra Configurations

- Lazy Git
- Flutter Compatibility
- Markdown Compatibility
- LSP Support

### Custom Keymaps

- Flutter Development Window -> `<leader>f`
- Flutter Dev Window -> <leader>fl

#### Catpuccin Custom Colour (feel free to copy or mess around with this)

```lua
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
        mocha = { 
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

          base = "#3A0842",
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
```
