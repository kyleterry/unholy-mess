-- [nfnl] Compiled from fnl/config/mappings.fnl by https://github.com/Olical/nfnl, do not edit.
local _local_1_ = require("config.utils")
local keymap = _local_1_["keymap"]
local opts = {noremap = true, unique = true, silent = true}
keymap("n", "<leader><space>", ":nohlsearch<cr>", opts)
keymap("v", ">", "><cr>gv", opts)
keymap("v", "<", "<<cr>gv", opts)
keymap("v", "J", ":m '>+1<cr>gv=gv", opts)
keymap("v", "K", ":m '<-2<cr>gv=gv", opts)
keymap("n", "<c-j>", "<c-w>j", {})
keymap("n", "<c-k>", "<c-w>k", {})
keymap("n", "<c-l>", "<c-w>l", {})
keymap("n", "<c-h>", "<c-w>h", {})
keymap("n", "<c-d>", "<c-d>zz", {})
keymap("n", "<c-u>", "<c-u>zz", {})
keymap("n", "n", "nzzzv", {})
keymap("n", "N", "Nzzzx", {})
keymap("x", "<leader>p", "\"_dP", {})
keymap("n", "<leader>cy", "\"+y", {desc = "yank to clipboard"})
keymap("v", "<leader>cy", "\"+y", {desc = "yank to clipboard"})
keymap("n", "<leader>cY", "\"+Y", {desc = "yank paragraph to clipboard"})
keymap("n", "<leader>cp", "\"+p", {desc = "paste from clipboard"})
keymap("n", "<leader>qk", "<cmd>cnext<cr>zz", {desc = "quickfix next"})
return keymap("n", "<leader>qj", "<cmd>cprev<cr>zz", {desc = "quickfix previous"})
