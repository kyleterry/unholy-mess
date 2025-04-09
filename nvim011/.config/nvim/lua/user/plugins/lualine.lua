-- [nfnl] Compiled from fnl/user/plugins/lualine.fnl by https://github.com/Olical/nfnl, do not edit.
local function _1_()
  local lualine = require("lualine")
  local theme = require("lualine.themes.gruvbox_dark")
  return lualine.setup({options = {theme = theme, section_separators = "", component_separators = "", icons_enabled = false}})
end
return {"nvim-lualine/lualine.nvim", dependencies = {"nvim-tree/nvim-web-devicons"}, config = _1_, lazy = false}
