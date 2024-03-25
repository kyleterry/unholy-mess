-- [nfnl] Compiled from fnl/plugins/gruvbox.fnl by https://github.com/Olical/nfnl, do not edit.
local gruvbox_config = {}
local function _1_()
  local theme = require("gruvbox")
  theme.setup(gruvbox_config)
  return vim.cmd("colorscheme gruvbox")
end
return {{"ellisonleao/gruvbox.nvim", priority = 1000, config = _1_}}
