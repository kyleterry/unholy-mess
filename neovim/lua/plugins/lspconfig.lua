-- [nfnl] Compiled from fnl/plugins/lspconfig.fnl by https://github.com/Olical/nfnl, do not edit.
local _local_1_ = require("nfnl.module")
local autoload = _local_1_["autoload"]
local nvim = autoload("nvim")
local cmp_deps = {"hrsh7th/cmp-nvim-lsp", "hrsh7th/cmp-buffer", "hrsh7th/cmp-path", "hrsh7th/cmp-cmdline", "hrsh7th/cmp-vsnip", "L3MON4D3/LuaSnip", "saadparwaiz1/cmp_luasnip", "PaterJason/cmp-conjure"}
local function _2_()
  local from_vscode = require("luasnip.loaders.from_vscode")
  return from_vscode.lazy_load()
end
local function _3_()
  local cmp = require("cmp")
  local cmp_sources = cmp.config.sources({{group_index = 2, name = "nvim_lsp"}, {name = "luasnip"}, {name = "conjure"}, {name = "nvim_lua"}, {name = "buffer"}, {name = "path"}})
  local cmp_src_menu_items = {copilot = "copilot", conjure = "conjure", nvim_lsp = "lsp", luasnip = "snippet", buffer = "buffer"}
  local luasnip = require("luasnip")
  local function _4_(args)
    return luasnip.expand(args.body)
  end
  local function _5_(fallback)
    if luasnip.jumpable() then
      return luasnip.jump(1)
    else
      return fallback()
    end
  end
  local function _7_(fallback)
    if luasnip.jumpable() then
      return luasnip.jump(-1)
    else
      return fallback()
    end
  end
  local function _9_(entry, item)
    item.menu = (cmp_src_menu_items[entry.source.name] or "")
    return item
  end
  cmp.setup({snippet = {expand = _4_}, mapping = {["<c-n>"] = cmp.mapping.select_next_item(), ["<c-p>"] = cmp.mapping.select_prev_item(), ["<c-b>"] = cmp.mapping.scroll_docs(( - 4)), ["<c-f>"] = cmp.mapping.scroll_docs(4), ["<c-space>"] = cmp.mapping.complete(), ["<c-e>"] = cmp.mapping.close(), ["<c-y>"] = cmp.mapping.confirm({behavior = cmp.ConfirmBehavior.Insert, select = true}), ["<tab>"] = cmp.mapping(_5_), ["<s-tab>"] = cmp.mapping(_7_)}, sources = cmp_sources, formatting = {format = _9_}})
  cmp.setup.cmdline({"/", "?"}, {mapping = cmp.mapping.preset.cmdline(), sources = {{name = "buffer"}}})
  return cmp.setup.cmdline({":"}, {mapping = cmp.mapping.preset.cmdline(), sources = cmp.config.sources({{name = "path"}}, {{name = "cmdline"}})})
end
local function _10_()
  local mason = require("mason")
  local mason_lsp = require("mason-lspconfig")
  local null_ls = require("null-ls")
  local mason_null_ls = require("mason-null-ls")
  mason.setup({})
  mason_lsp.setup({ensure_installed = {"lua_ls"}})
  mason_null_ls.setup({ensure_installed = {"gofumpt", "delve", "goimports"}})
  return null_ls.setup({})
end
local function _11_()
  local lsp = require("lspconfig")
  local cmplsp = require("cmp_nvim_lsp")
  local lspfmt = require("lsp-format")
  local nset = nvim.buf_set_keymap
  local opts = {noremap = true}
  local capabilities = cmplsp.default_capabilities(vim.lsp.protocol.make_client_capabilities())
  local on_attach
  local function _12_(client, bufnr)
    lspfmt.on_attach(client, bufnr)
    local function _13_()
      opts.desc = "go to definition"
      return opts
    end
    nset(bufnr, "n", "gd", ":lua vim.lsp.buf.definition()<CR>", _13_())
    local function _14_()
      opts.desc = "go to declaration"
      return opts
    end
    nset(bufnr, "n", "gD", ":lua vim.lsp.buf.declaration()<CR>", _14_())
    local function _15_()
      opts.desc = "show references"
      return opts
    end
    nset(bufnr, "n", "gr", ":lua vim.lsp.buf.references()<CR>", _15_())
    local function _16_()
      opts.desc = "show symbols"
      return opts
    end
    nset(bufnr, "n", "<leader>ds", ":lua require('telescope.builtin').lsp_document_symbols()<cr>", _16_())
    local function _17_()
      opts.desc = "lsp hover"
      return opts
    end
    nset(bufnr, "n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>", _17_())
    local function _18_()
      opts.desc = "show signature help"
      return opts
    end
    nset(bufnr, "n", "<A-k>", "<Cmd>lua vim.lsp.buf.signature_help()<CR>", _18_())
    local function _19_()
      opts.desc = "run code formatter"
      return opts
    end
    return nset(bufnr, "n", "<space>a", "<Cmd>lua vim.lsp.buf.format()<CR>", _19_())
  end
  on_attach = _12_
  capabilities.textDocument.completion.completionItem["snippetSupport"] = true
  lsp.fennel_language_server.setup({on_attach = on_attach, capabilities = capabilities, root_dir = lsp.util.root_pattern("fnl", "lua"), settings = {fennel = {diagnostics = {globals = {"vim", "jit", "comment"}}, workspace = {library = vim.api.nvim_list_runtime_paths()}}}})
  return lsp.gopls.setup({cmd = {"gopls"}, on_attach = on_attach, capabilities = capabilities, settings = {gopls = {experimentalPostfixCompletions = true, gofumpt = true, codelenses = {gc_details = true, generate = true, test = true, tidy = true, upgrade_dependency = true}, analyses = {unusedparams = true, unusedwrite = true, nilness = true, useany = true, shadow = true}, hints = {assignVariableTypes = true, compositeLiteralTypes = true, compositeListeralFields = true, contantValues = true, functionTypeParameters = true, rangeVariableTypes = true}, usePlaceholders = true, completeUnimported = true, semanticTokens = true, staticcheck = true}}, init_options = {usePlaceholders = true}})
end
return {{"L3MON4D3/LuaSnip", dependencies = {"rafamadriz/friendly-snippets"}, build = "make install_jsregexp", opts = {history = true, delete_check_events = "TextChanged"}, config = _2_}, {"hrsh7th/nvim-cmp", dependencies = cmp_deps, config = _3_}, {"williamboman/mason.nvim", dependencies = {"williamboman/mason-lspconfig.nvim", "nvimtools/none-ls.nvim", "jay-babu/mason-null-ls.nvim"}, config = _10_}, {"neovim/nvim-lspconfig", opts = {}, dependencies = {"lukas-reineke/lsp-format.nvim"}, config = _11_}}
