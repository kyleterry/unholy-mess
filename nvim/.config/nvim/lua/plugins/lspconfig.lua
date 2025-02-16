-- [nfnl] Compiled from fnl/plugins/lspconfig.fnl by https://github.com/Olical/nfnl, do not edit.
local _local_1_ = require("nfnl.module")
local autoload = _local_1_["autoload"]
local nvim = autoload("nvim")
local function has_words_before()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return ((col ~= 0) and (vim.api.nvim_buf_get_lines(0, (line - 1), line, true)[1]:sub(col, col):match("%s") == nil))
end
local cmp_deps = {"hrsh7th/cmp-nvim-lsp", "hrsh7th/cmp-buffer", "hrsh7th/cmp-path", "hrsh7th/cmp-cmdline", "hrsh7th/cmp-vsnip", "hrsh7th/cmp-nvim-lua", "L3MON4D3/LuaSnip", "saadparwaiz1/cmp_luasnip", "PaterJason/cmp-conjure"}
local function _2_()
  local from_vscode = require("luasnip.loaders.from_vscode")
  return from_vscode.lazy_load()
end
local function _3_()
  local cmp = require("cmp")
  local cmp_sources = cmp.config.sources({{name = "nvim_lua"}, {name = "nvim_lsp"}, {name = "luasnip"}, {name = "conjure"}, {name = "buffer"}, {name = "path"}})
  local cmp_src_menu_items = {conjure = "conjure", nvim_lsp = "lsp", luasnip = "snippet", buffer = "buffer"}
  local luasnip = require("luasnip")
  local function _4_(args)
    return luasnip.lsp_expand(args.body)
  end
  local function _5_(fallback)
    if luasnip.jumpable() then
      return luasnip.jump(-1)
    elseif "else" then
      return fallback()
    else
      return nil
    end
  end
  local function _7_(fallback)
    if luasnip.jumpable() then
      return luasnip.jump(1)
    elseif "else" then
      return fallback()
    else
      return nil
    end
  end
  local function _9_(fallback)
    if cmp.visible() then
      return cmp.select_next_item()
    elseif luasnip.expand_or_jumpable() then
      return luasnip.expand_or_jump()
    elseif has_words_before() then
      return cmp.complete()
    elseif "else" then
      return fallback()
    else
      return nil
    end
  end
  local function _11_(fallback)
    if cmp.visible() then
      return cmp.select_prev_item()
    elseif luasnip.jumpable() then
      return luasnip.jump(-1)
    elseif "else" then
      return fallback()
    else
      return nil
    end
  end
  local function _13_(entry, item)
    item.menu = (cmp_src_menu_items[entry.source.name] or "")
    return item
  end
  cmp.setup({snippet = {expand = _4_}, mapping = {["<c-n>"] = cmp.mapping.select_next_item(), ["<c-p>"] = cmp.mapping.select_prev_item(), ["<c-b>"] = cmp.mapping.scroll_docs(( - 4)), ["<c-f>"] = cmp.mapping.scroll_docs(4), ["<c-space>"] = cmp.mapping.complete(), ["<c-e>"] = cmp.mapping.close(), ["<c-y>"] = cmp.mapping.confirm({behavior = cmp.ConfirmBehavior.Insert, select = true}), ["<c-h>"] = cmp.mapping(_5_, {"i"}), ["<c-l>"] = cmp.mapping(_7_, {"i"}), ["<tab>"] = cmp.mapping(_9_, {"i", "s"}), ["<s-tab>"] = cmp.mapping(_11_, {"i", "s"})}, sources = cmp_sources, formatting = {format = _13_}})
  cmp.setup.cmdline({"/", "?"}, {mapping = cmp.mapping.preset.cmdline(), sources = {{name = "buffer"}}})
  return cmp.setup.cmdline({":"}, {mapping = cmp.mapping.preset.cmdline(), sources = cmp.config.sources({{name = "path"}}, {{name = "cmdline"}})})
end
local function _14_()
  local lint = require("lint")
  local lint_ag = vim.api.nvim_create_augroup("lint", {clear = true})
  lint.linters_by_ft = {go = {"golangcilint"}, fennel = {"fennel"}, lua = {"luacheck"}, sh = {"shellcheck"}, bash = {"shellcheck"}, nix = {"nix"}}
  local function _15_()
    return lint.try_lint()
  end
  return vim.api.nvim_create_autocmd({"BufEnter", "BufWritePost", "InsertLeave"}, {group = lint_ag, callback = _15_})
end
local function _16_()
  local conform = require("conform")
  return conform.setup({formatters_by_ft = {fennel = {"fnlfmt"}, lua = {"stylua"}, tf = {"tfmt"}, terraform = {"tfmt"}, hcl = {"tfmt"}}, format_on_save = {lsp_fallback = true, timeout_ms = 500, async = false}, formatters = {tfmt = {command = "tofu", args = {"fmt", "-"}, stdin = true}}})
end
local function _17_()
  local mason = require("mason")
  local mason_lsp = require("mason-lspconfig")
  local null_ls = require("null-ls")
  local mason_null_ls = require("mason-null-ls")
  mason.setup({})
  mason_lsp.setup({ensure_installed = {"lua_ls", "gopls", "nil_ls", "terraformls"}})
  mason_null_ls.setup({ensure_installed = {"gofumpt", "delve", "goimports", "luacheck", "shellcheck", "tflint", "zls"}})
  return null_ls.setup({})
end
local function _18_()
  local lsp = require("lspconfig")
  local cmplsp = require("cmp_nvim_lsp")
  local lspfmt = require("lsp-format")
  local nset = nvim.buf_set_keymap
  local opts = {noremap = true}
  local opts_with_desc
  local function _19_(desc)
    opts.desc = desc
    return opts
  end
  opts_with_desc = _19_
  local capabilities = cmplsp.default_capabilities(vim.lsp.protocol.make_client_capabilities())
  local on_attach
  local function _20_(client, bufnr)
    lspfmt.on_attach(client, bufnr)
    nset(bufnr, "n", "<leader>rn", ":lua vim.lsp.buf.rename()<CR>", opts_with_desc("rename ident"))
    nset(bufnr, "n", "<leader>ca", ":lua vim.lsp.buf.code_action()<CR>", opts_with_desc("code action"))
    nset(bufnr, "n", "gd", ":lua vim.lsp.buf.definition()<CR>", opts_with_desc("go to definition"))
    nset(bufnr, "n", "gD", ":lua vim.lsp.buf.declaration()<CR>", opts_with_desc("go to declaration"))
    nset(bufnr, "n", "gr", ":lua vim.lsp.buf.references()<CR>", opts_with_desc("show references"))
    nset(bufnr, "n", "<leader>ds", ":lua require('telescope.builtin').lsp_document_symbols()<cr>", opts_with_desc("show symbols"))
    nset(bufnr, "n", "<leader>dr", ":lua require('telescope.builtin').lsp_references()<cr>", opts_with_desc("show lsp references"))
    nset(bufnr, "n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>", opts_with_desc("lsp hover"))
    nset(bufnr, "n", "<a-k>", "<Cmd>lua vim.lsp.buf.signature_help()<CR>", opts_with_desc("show signature help"))
    return nset(bufnr, "n", "<space>a", "<Cmd>lua vim.lsp.buf.format()<CR>", opts_with_desc("run code formatter"))
  end
  on_attach = _20_
  local quick_setups = {"lua_ls", "terraformls", "tflint", "sqlls", "html", "htmx", "nil_ls", "clangd", "templ", "zls"}
  capabilities.textDocument.completion.completionItem["snippetSupport"] = true
  lsp.fennel_language_server.setup({on_attach = on_attach, capabilities = capabilities, settings = {fennel = {workspace = {library = vim.api.nvim_list_runtime_paths(), checkThirdParty = false}, diagnostics = {globals = {"vim", "Snacks"}}}}})
  lsp.gopls.setup({cmd = {"gopls"}, on_attach = on_attach, capabilities = capabilities, settings = {gopls = {experimentalPostfixCompletions = true, gofumpt = true, codelenses = {gc_details = true, generate = true, test = true, tidy = true, upgrade_dependency = true}, analyses = {unusedparams = true, unusedwrite = true, nilness = true, useany = true, shadow = true}, hints = {assignVariableTypes = true, compositeLiteralTypes = true, compositeListeralFields = true, contantValues = true, functionTypeParameters = true, rangeVariableTypes = true}, usePlaceholders = true, completeUnimported = true, semanticTokens = true, staticcheck = true}}, init_options = {usePlaceholders = true}})
  for _, val in ipairs(quick_setups) do
    lsp[val].setup({capabilities = capabilities, on_attach = on_attach})
  end
  return nil
end
return {{"L3MON4D3/LuaSnip", dependencies = {"rafamadriz/friendly-snippets"}, build = "make install_jsregexp", opts = {history = true, delete_check_events = "TextChanged"}, config = _2_, lazy = false}, {"hrsh7th/nvim-cmp", dependencies = cmp_deps, config = _3_}, {"mfussenegger/nvim-lint", event = {"BufReadPre", "BufNewFile"}, config = _14_}, {"stevearc/conform.nvim", event = {"BufReadPre", "BufNewFile"}, config = _16_}, {"williamboman/mason.nvim", dependencies = {"williamboman/mason-lspconfig.nvim", "nvimtools/none-ls.nvim", "jay-babu/mason-null-ls.nvim"}, config = _17_}, {"neovim/nvim-lspconfig", opts = {}, dependencies = {"lukas-reineke/lsp-format.nvim"}, config = _18_}}
