-- [nfnl] Compiled from fnl/config/init.fnl by https://github.com/Olical/nfnl, do not edit.
local _local_1_ = require("nfnl.module")
local autoload = _local_1_["autoload"]
local nvim = autoload("nvim")
local core = autoload("nfnl.core")
nvim.set_keymap("n", "<space>", "<nop>", {noremap = true})
local options = {undodir = (vim.fn.stdpath("cache") .. "/undo"), undofile = true, title = true, expandtab = true, tabstop = 2, shiftwidth = 2, softtabstop = 2, shiftround = true, autoindent = true, completeopt = "menu,menuone,noselect", ignorecase = true, smartcase = true, smarttab = true, hlsearch = true, incsearch = true, showmatch = true, matchpairs = "(:),{:},[:],<:>", clipboard = "unnamedplus", number = true, numberwidth = 3, relativenumber = true, signcolumn = "yes", linebreak = true, cursorline = true, cursorcolumn = true, scrolloff = 3, mouse = "", writebackup = false, wrap = false, swapfile = false, backup = false}
for option, value in pairs(options) do
  core.assoc(nvim.o, option, value)
end
return nil
