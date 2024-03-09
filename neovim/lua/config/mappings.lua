-- [nfnl] Compiled from fnl/config/mappings.fnl by https://github.com/Olical/nfnl, do not edit.
local _local_1_ = require("config.utils")
local keymap = _local_1_["keymap"]
local opts = {noremap = true, unique = true, silent = true}
keymap("n", "<leader><space>", ":nohlsearch<cr>", opts)
keymap("v", ">", "><cr>gv", opts)
keymap("v", "<", "<<cr>gv", opts)
keymap("n", "<c-j>", "<c-w>j", {})
keymap("n", "<c-k>", "<c-w>k", {})
keymap("n", "<c-l>", "<c-w>l", {})
return keymap("n", "<c-h>", "<c-w>h", {})
