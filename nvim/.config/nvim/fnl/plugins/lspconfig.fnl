(local {: autoload} (require :nfnl.module))
  (local nvim (autoload :nvim))

(fn has-words-before []
  (let [(line col) (unpack (vim.api.nvim_win_get_cursor 0))]
    (and (not= col 0)
         (= (: (: (. (vim.api.nvim_buf_get_lines 0 (- line 1) line true) 1) :sub col col) :match "%s") nil))))

(local cmp-deps [:hrsh7th/cmp-nvim-lsp
                 :hrsh7th/cmp-buffer
                 :hrsh7th/cmp-path
                 :hrsh7th/cmp-cmdline
                 :hrsh7th/cmp-vsnip
                 :hrsh7th/cmp-nvim-lua
                 :L3MON4D3/LuaSnip
                 :saadparwaiz1/cmp_luasnip
                 :PaterJason/cmp-conjure])
[{1 :zbirenbaum/copilot.lua
  :dependencies [:zbirenbaum/copilot-cmp]
  :event :InsertEnter
  :config (fn []
            (let [copilot (require :copilot)
                  copilot-cmp (require :copilot_cmp)]
              (copilot.setup {})
              (copilot-cmp.setup {})))}
 {1 :L3MON4D3/LuaSnip
  :lazy false
  :dependencies [:rafamadriz/friendly-snippets]
  :build "make install_jsregexp"
  :opts {:history true
         :delete_check_events :TextChanged}
  :config (fn []
            (let [from_vscode (require :luasnip.loaders.from_vscode)]
              (from_vscode.lazy_load)))}
 {1 :hrsh7th/nvim-cmp
  :dependencies cmp-deps
  :config (fn []
            (let [cmp (require :cmp)
                  cmp-sources (cmp.config.sources
                                [
                                 {:name :nvim_lua}
                                 {:name :nvim_lsp}
                                 {:name :luasnip}
                                 {:name :conjure}
                                 {:name :copilot :group_index 2}
                                 {:name :buffer}
                                 {:name :path}])
                  cmp-src-menu-items {:conjure :conjure
                                      :nvim_lsp :lsp
                                      :luasnip :snippet
                                      :buffer :buffer}
                  luasnip (require :luasnip)]
              (cmp.setup
                {:snippet {:expand (fn [args]
                                     (luasnip.lsp_expand args.body))}
                 :mapping {:<c-n> (cmp.mapping.select_next_item)
                           :<c-p> (cmp.mapping.select_prev_item)
                           :<c-b> (cmp.mapping.scroll_docs (- 4))
                           :<c-f> (cmp.mapping.scroll_docs 4)
                           :<c-space> (cmp.mapping.complete)
                           :<c-e> (cmp.mapping.close)
                           :<c-y> (cmp.mapping.confirm
                                    {:behavior cmp.ConfirmBehavior.Insert
                                     :select true})
                           ; experimenting with better snippet argument jumping with ctrl-h and ctrl-l
                           :<c-h> (cmp.mapping (fn [fallback]
                                                 (if (luasnip.jumpable) (luasnip.jump -1)
                                                     :else (fallback)))
                                               {1 :i})
                           :<c-l> (cmp.mapping (fn [fallback]
                                                 (if (luasnip.jumpable) (luasnip.jump 1)
                                                     :else (fallback)))
                                               {1 :i})
                           :<tab> (cmp.mapping 
                                    (fn [fallback]
                                      (if (cmp.visible) (cmp.select_next_item)
                                          (luasnip.expand_or_jumpable) (luasnip.expand_or_jump)
                                          (has-words-before) (cmp.complete)
                                          :else (fallback)))
                                    {1 :i 2 :s})
                           :<s-tab> (cmp.mapping 
                                      (fn [fallback]
                                        (if (cmp.visible) (cmp.select_prev_item)
                                            (luasnip.jumpable) (luasnip.jump -1)
                                            :else (fallback)))
                                      {1 :i 2 :s})}
                 :sources cmp-sources
                 :formatting {:format (fn [entry item]
                                        (set item.menu
                                             (or (. cmp-src-menu-items entry.source.name) ""))
                                        item)}})
              (cmp.setup.cmdline ["/" "?"]
                                 {:mapping (cmp.mapping.preset.cmdline)
                                  :sources [{:name :buffer}]})
              (cmp.setup.cmdline [":"]
                                 {:mapping (cmp.mapping.preset.cmdline)
                                  :sources (cmp.config.sources
                                             [{:name :path}]
                                             [{:name :cmdline}])})))}
 {1 :mfussenegger/nvim-lint
  :event [:BufReadPre :BufNewFile]
  :config (fn []
            (let [lint (require :lint)
                  lint-ag (vim.api.nvim_create_augroup :lint {:clear true})]
              (set lint.linters_by_ft {:go [:golangcilint]
                                       :fennel [:fennel]
                                       :lua [:luacheck]
                                       :sh [:shellcheck]
                                       :bash [:shellcheck]
                                       :nix [:nix]})
              (vim.api.nvim_create_autocmd [:BufEnter :BufWritePost :InsertLeave]
                {:group lint-ag
                 :callback (fn []
                            (lint.try_lint))})))}
 {1 :stevearc/conform.nvim
  :event [:BufReadPre :BufNewFile]
  :config (fn []
            (let [conform (require :conform)]
              (conform.setup {:formatters_by_ft {:fennel [:fnlfmp]
                                                 :lua [:stylua]}
                              :format_on_save {:lsp_fallback true
                                               :async false
                                               :timeout_ms 500}})))}
 {1 :williamboman/mason.nvim
  :dependencies [:williamboman/mason-lspconfig.nvim
                 :nvimtools/none-ls.nvim
                 :jay-babu/mason-null-ls.nvim]
  :config (fn []
            (let [mason (require :mason)
                  mason-lsp (require :mason-lspconfig)
                  null-ls (require :null-ls)
                  mason-null-ls (require :mason-null-ls)]
              (mason.setup {})
              (mason-lsp.setup {:ensure_installed [:lua_ls :gopls :nil_ls :bashls :terraformls]})
              (mason-null-ls.setup {:ensure_installed [:gofumpt :delve :goimports :luacheck :shellcheck :tflint]})
              (null-ls.setup {})))}
 {1 :neovim/nvim-lspconfig
  :opts {}
  :dependencies [:lukas-reineke/lsp-format.nvim]
  :config (fn []
            (let [lsp (require :lspconfig)
                  cmplsp (require :cmp_nvim_lsp)
                  lspfmt (require :lsp-format)
                  nset nvim.buf_set_keymap
                  opts {:noremap true} ; add :silent true if it's loud
                  opts-with-desc (fn [desc] (do (set opts.desc desc) opts))
                  capabilities (cmplsp.default_capabilities (vim.lsp.protocol.make_client_capabilities))
                  on-attach (fn [client bufnr]
                              (do
                                (lspfmt.on_attach client bufnr)
                                (nset bufnr :n :<leader>rn ":lua vim.lsp.buf.rename()<CR>" (opts-with-desc "rename ident"))
                                (nset bufnr :n :<leader>ca ":lua vim.lsp.buf.code_action()<CR>" (opts-with-desc "code action"))
                                (nset bufnr :n :gd ":lua vim.lsp.buf.definition()<CR>" (opts-with-desc "go to definition"))
                                (nset bufnr :n :gD ":lua vim.lsp.buf.declaration()<CR>" (opts-with-desc "go to declaration"))
                                (nset bufnr :n :gr ":lua vim.lsp.buf.references()<CR>" (opts-with-desc "show references"))
                                (nset bufnr :n :<leader>ds ":lua require('telescope.builtin').lsp_document_symbols()<cr>" (opts-with-desc "show symbols"))
                                (nset bufnr :n :<leader>dr ":lua require('telescope.builtin').lsp_references()<cr>" (opts-with-desc "show lsp references"))
                                (nset bufnr :n :K "<Cmd>lua vim.lsp.buf.hover()<CR>" (opts-with-desc "lsp hover"))
                                (nset bufnr :n :<a-k> "<Cmd>lua vim.lsp.buf.signature_help()<CR>" (opts-with-desc "show signature help"))
                                (nset bufnr :n :<space>a "<Cmd>lua vim.lsp.buf.format()<CR>" (opts-with-desc "run code formatter"))))
                  quick-setups [:lua_ls :bashls :terraformls :tflint :sqlls :html :htmx :nil_ls :clangd :templ]] ; these setups don't require config outside capabilities and on_attach

              (tset capabilities.textDocument.completion.completionItem :snippetSupport true)
              (lsp.fennel_language_server.setup
                {:on_attach on-attach
                 :capabilities capabilities
                 :root_dir (lsp.util.root_pattern :fnl :lua)
                 :settings {:fennel {:diagnostics
                                     {:globals [:vim :jit :comment]}
                                      :workspace {:library (vim.api.nvim_list_runtime_paths)}}}})
              (lsp.gopls.setup
                {:cmd  [:gopls]
                 :on_attach on-attach
                 :capabilities capabilities
                 :settings {:gopls {:experimentalPostfixCompletions true
                                    :gofumpt true
                                    :codelenses {:gc_details true
                                                 :generate true
                                                 :test true
                                                 :tidy true
                                                 :upgrade_dependency true}
                                    :analyses {:unusedparams true
                                               :unusedwrite true
                                               :nilness true
                                               :useany true
                                               :shadow true}
                                    :hints {:assignVariableTypes true
                                            :compositeLiteralTypes true
                                            :compositeListeralFields true
                                            :contantValues true
                                            :functionTypeParameters true
                                            :rangeVariableTypes true}
                                    :usePlaceholders true
                                    :completeUnimported true
                                    :semanticTokens true
                                    :staticcheck true}}
                 :init_options {:usePlaceholders true}})
              (each [_ val (ipairs quick-setups)]
                ((. lsp val :setup) {:capabilities capabilities
                                     :on_attach on-attach}))))}]
