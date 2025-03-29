-- [nfnl] Compiled from fnl/user/options.fnl by https://github.com/Olical/nfnl, do not edit.
local _local_1_ = require("nfnl.module")
local autoload = _local_1_["autoload"]
local core = autoload("nfnl.core")
local options = {title = true, expandtab = true, tabstop = 2, shiftwidth = 2, softtabstop = 2, autoindent = true, ignorecase = true, number = true, numberwidth = 3, relativenumber = true, signcolumn = "yes", completeopt = "menuone,popup,fuzzy", cursorline = true, cursorcolumn = true, scrolloff = 3, mouse = "", backup = false, swapfile = false, wrap = false, writebackup = false}
for option, value in pairs(options) do
  core.assoc(vim.o, option, value)
end
return nil
