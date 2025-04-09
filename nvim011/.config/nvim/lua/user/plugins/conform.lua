-- [nfnl] Compiled from fnl/user/plugins/conform.fnl by https://github.com/Olical/nfnl, do not edit.
local ft__3eformatters = {fennel = {"fnlfmt"}, go = {"gofumpt", "goimports"}, lua = {"stylua"}, tf = {"tfmt"}, terraform = {"tfmt"}, hcl = {"tfmt"}}
local formatters = {tfmt = {command = "tofu", args = {"fmt", "-"}, stdin = true}}
return {"stevearc/conform.nvim", event = {"BufReadPre", "BufNewFile"}, opts = {formatters_by_ft = ft__3eformatters, format_on_save = {lsp_fallback = true, timeout_ms = 500, async = false}, formatters = formatters}}
