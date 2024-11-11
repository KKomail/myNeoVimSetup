-- This file collects all plugin configurations from individual files

local plugins_list = {}

local plugin_files = {
  "gruvbox",
  "trouble",
  "cmp",
  "telescope",
  "lsp",
  "treesitter",
  "lualine",
  "mason",
}

for _, plugin_file in ipairs(plugin_files) do
  local ok, plugins = pcall(require, "plugins." .. plugin_file)
  if ok then
    vim.list_extend(plugins_list, plugins)
  else
    vim.notify("Failed to load plugin file: " .. plugin_file, vim.log.levels.ERROR)
  end
end

return plugins_list
