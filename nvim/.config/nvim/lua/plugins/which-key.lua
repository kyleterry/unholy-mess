-- [nfnl] Compiled from fnl/plugins/which-key.fnl by https://github.com/Olical/nfnl, do not edit.
local function _1_()
  vim.opt["timeout"] = true
  vim.opt["timeoutlen"] = 300
  local wk = require("which-key")
  local plugins = {marks = true, registers = true, spelling = {enabled = true}}
  local icons = {separator = "->", breakcrumb = ">>"}
  return wk.setup({plugins = plugins, icons = icons})
end
return {{"folke/which-key.nvim", event = "VeryLazy", init = _1_}}
