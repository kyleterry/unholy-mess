-- [nfnl] Compiled from fnl/user/lsp.fnl by https://github.com/Olical/nfnl, do not edit.
local lsp = vim.lsp
lsp.config("*", {capabilities = require("blink.cmp").get_lsp_capabilities()})
lsp.config.gopls = {cmd = {"gopls"}, root_markers = {"go.mod"}, filetypes = {"go", "gomod"}}
lsp.config.luals = {cmd = {"lua-language-server"}, root_markers = {".luarc.json", ".luarc.jsonc"}, filetypes = {"lua"}, settings = {Lua = {runtime = {version = "LuaJIT"}}}}
lsp.enable({"gopls", "goimports", "luals"})
local function _1_(ev)
  local client = lsp.get_client_by_id(ev.data.client_id)
  if client:supports_method("textDocument/completion") then
    return lsp.completion.enable(true, client.id, ev.buf, {autotrigger = true})
  else
    return nil
  end
end
return vim.api.nvim_create_autocmd("LspAttach", {callback = _1_})
