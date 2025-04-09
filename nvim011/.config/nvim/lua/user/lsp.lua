-- [nfnl] Compiled from fnl/user/lsp.fnl by https://github.com/Olical/nfnl, do not edit.
vim.lsp.config("*", {capabilities = require("blink.cmp").get_lsp_capabilities()})
vim.lsp.config["gopls"] = {cmd = {"gopls"}, root_markers = {"go.mod"}, filetypes = {"go", "gomod"}, settings = {gopls = {experimentalPostfixCompletions = true, gofumpt = true, codelenses = {gc_details = true, generate = true, test = true, tidy = true, upgrade_dependency = true}, analyses = {unusedparams = true, unusedwrite = true, nilness = true, useany = true, shadow = true}, hints = {assignVariableTypes = true, compositeLiteralTypes = true, compositeListeralFields = true, contantValues = true, functionTypeParameters = true, rangeVariableTypes = true}, usePlaceholders = true, completeUnimported = true, semanticTokens = true, staticcheck = true}}}
vim.lsp.config["luals"] = {cmd = {"lua-language-server"}, root_markers = {".luarc.json", ".luarc.jsonc"}, filetypes = {"lua"}, settings = {Lua = {runtime = {version = "LuaJIT"}}}}
vim.lsp.enable({"gopls", "luals"})
local function _1_(ev)
  local client = vim.lsp.get_client_by_id(ev.data.client_id)
  if client:supports_method("textDocument/completion") then
    vim.lsp.completion.enable(true, client.id, ev.buf, {autotrigger = true})
  else
  end
  if (not client:supports_method("textDocument/willSaveWaitUntil") and client:supports_method("textDocument/formatting")) then
    local function _3_()
      return vim.lsp.buf.format({bufnr = ev.buf, id = client.id, timeout_ms = 1000})
    end
    return vim.api.nvim_create_autocmd("BufWritePre", {group = vim.api.nvim_create_augroup("custom.lsp", {clear = false}), buffer = ev.buf, callback = _3_})
  else
    return nil
  end
end
return vim.api.nvim_create_autocmd("LspAttach", {group = vim.api.nvim_create_augroup("custom.lsp", {}), callback = _1_})
