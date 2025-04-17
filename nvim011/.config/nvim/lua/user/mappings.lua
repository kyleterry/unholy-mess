-- [nfnl] Compiled from fnl/user/mappings.fnl by https://github.com/Olical/nfnl, do not edit.
local _local_1_ = require("nfnl.module")
local autoload = _local_1_["autoload"]
local core = autoload("nfnl.core")
local _local_2_ = require("user.utils")
local keymap = _local_2_["keymap"]
local opts = _local_2_["opts"]
keymap("n", "<leader><space>", ":nohlsearch<cr>", core.merge(opts["default-silent"], {desc = "cancel search highlighting"}))
keymap("v", ">", "><cr>gv", core.merge(opts["default-silent"], {desc = "indent selection right"}))
keymap("v", "<", "<<cr>gv", core.merge(opts["default-silent"], {desc = "indent selection left"}))
keymap("v", "J", ":m '>+1<cr>gv=gv", core.merge(opts["default-silent"], {desc = "move selection up"}))
keymap("v", "K", ":m '<-2<cr>gv=gv", core.merge(opts["default-silent"], {desc = "move selection down"}))
keymap("n", "<c-j>", "<c-w>j", {})
keymap("n", "<c-k>", "<c-w>k", {})
keymap("n", "<c-l>", "<c-w>l", {})
keymap("n", "<c-h>", "<c-w>h", {})
keymap("x", "<leader>p", "\"_dP", {})
keymap("n", "<leader>cy", "\"+y", {desc = "yank to clipboard"})
keymap("v", "<leader>cy", "\"+y", {desc = "yank to clipboard"})
keymap("n", "<leader>cY", "\"+Y", {desc = "yank paragraph to clipboard"})
return keymap("n", "<leader>cp", "\"+p", {desc = "paste from clipboard"})
