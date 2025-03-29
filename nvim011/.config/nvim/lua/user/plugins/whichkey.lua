-- [nfnl] Compiled from fnl/user/plugins/whichkey.fnl by https://github.com/Olical/nfnl, do not edit.
local _local_1_ = require("user.utils")
local lazy_keymap = _local_1_["lazy-keymap"]
local function _2_()
  return require("which-key").show({global = false})
end
return {"folke/which-key.nvim", event = "VeryLazy", opts = {plugins = {marks = true, registers = true, spelling = {enabled = true, suggestions = 10}}, icons = {separator = "->", breadcrumb = ">>", mappings = false}}, keys = {lazy_keymap("<leader>?", _2_, "show buffer local keymaps")}}
