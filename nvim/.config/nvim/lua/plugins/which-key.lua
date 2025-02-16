-- [nfnl] Compiled from fnl/plugins/which-key.fnl by https://github.com/Olical/nfnl, do not edit.
local function _1_()
  local wk = require("which-key")
  return wk.show({global = false})
end
return {{"folke/which-key.nvim", event = "VeryLazy", opts = {plugins = {marks = true, registers = true, spelling = {enabled = true, suggestions = 10}}, icons = {separator = "->", breadcrumb = ">>", mappings = false}}, keys = {{"<leader>?", _1_, desc = "Show buffer local keymaps"}}}}
