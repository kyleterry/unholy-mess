-- [nfnl] Compiled from fnl/config/autocmds.fnl by https://github.com/Olical/nfnl, do not edit.
local text_ag = vim.api.nvim_create_augroup("text", {clear = true})
return vim.api.nvim_create_autocmd({"BufRead", "BufNewFile", "BufWritePost"}, {group = text_ag, pattern = {"*.md", "*.txt", "*.tex"}, command = "setlocal textwidth=80 spell"})
