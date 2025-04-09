-- [nfnl] Compiled from fnl/user/diagnostics.fnl by https://github.com/Olical/nfnl, do not edit.
local _local_1_ = require("nfnl.module")
local autoload = _local_1_["autoload"]
local core = autoload("nfnl.core")
local _local_2_ = require("user.utils")
local keymap = _local_2_["keymap"]
local opts = _local_2_["opts"]
vim.diagnostic.config({virtual_text = true, signs = true, float = {header = "", prefix = "", source = "if_many", border = "single", title = "Diagnostic:", title_pos = "left", focusable = false}, virtual_lines = false})
local function _3_()
  return vim.diagnostic.open_float(0, {scope = "line", close_events = {"BufLeave", "CursorMoved", "InsertEnter", "FocusLost"}})
end
keymap("n", "<space>e", _3_, {noremap = true, silent = true})
keymap("n", "<space>lQ", vim.diagnostic.setqflist, {noremap = true, silent = true})
keymap("n", "<space>lq", vim.diagnostic.setloclist, {noremap = true, silent = true})
keymap("n", "[e", vim.diagnostic.goto_prev, {noremap = true, silent = true})
return keymap("n", "]e", vim.diagnostic.goto_next, {noremap = true, silent = true})
