(local {: autoload} (require :nfnl.module))
(local nvim (autoload :nvim))

(local cmp-deps [:hrsh7th/cmp-nvim-lsp
                 :hrsh7th/cmp-buffer
                 :hrsh7th/cmp-path
                 :hrsh7th/cmp-cmdline
                 :hrsh7th/cmp-vsnip
                 :L3MON4D3/LuaSnip
                 :saadparwaiz1/cmp_luasnip
                 :PaterJason/cmp-conjure])

[{1 :L3MON4D3/LuaSnip
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
                                [{:group_index 2 :name :nvim_lsp}
                                 {:name :luasnip}
                                 {:name :conjure}
                                 {:name :nvim_lua}
                                 {:name :buffer}
                                 {:name :path}])
                  cmp-src-menu-items {:copilot :copilot
                                      :conjure :conjure
                                      :nvim_lsp :lsp
                                      :luasnip :snippet
                                      :buffer :buffer}
                  luasnip (require :luasnip)]
              (cmp.setup
                {:snippet {:expand (fn [args]
                                     (luasnip.expand args.body))}
                 :mapping {:<c-n> (cmp.mapping.select_next_item)
                           :<c-p> (cmp.mapping.select_prev_item)
                           :<c-b> (cmp.mapping.scroll_docs (- 4))
                           :<c-f> (cmp.mapping.scroll_docs 4)
                           :<c-space> (cmp.mapping.complete)
                           :<c-e> (cmp.mapping.close)
                           "<c-y>" (cmp.mapping.confirm
                                      {:behavior cmp.ConfirmBehavior.Insert
                                       :select true})
                           :<tab> (cmp.mapping 
                                    (fn [fallback]
                                      (if (luasnip.jumpable)
                                        (luasnip.jump 1)
                                        (fallback))))
                           :<s-tab> (cmp.mapping 
                                    (fn [fallback]
                                      (if (luasnip.jumpable)
                                        (luasnip.jump -1)
                                        (fallback))))}
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
              (mason-lsp.setup {:ensure_installed [:lua_ls]})
              (mason-null-ls.setup {:ensure_installed [:gofumpt :delve :goimports]})
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
                  capabilities (cmplsp.default_capabilities (vim.lsp.protocol.make_client_capabilities))
                  on-attach (fn [client bufnr]
                              (do
                                (lspfmt.on_attach client bufnr)
                                (nset bufnr :n :gd ":lua vim.lsp.buf.definition()<CR>" (do (set opts.desc "go to definition") opts))
                                (nset bufnr :n :gD ":lua vim.lsp.buf.declaration()<CR>" (do (set opts.desc "go to declaration") opts))
                                (nset bufnr :n :gr ":lua vim.lsp.buf.references()<CR>" (do (set opts.desc "show references") opts))
                                (nset bufnr :n :<leader>ds ":lua require('telescope.builtin').lsp_document_symbols()<cr>" (do (set opts.desc "show symbols") opts))
                                (nset bufnr :n :K "<Cmd>lua vim.lsp.buf.hover()<CR>" (do (set opts.desc "lsp hover") opts))
                                (nset bufnr :n :<A-k> "<Cmd>lua vim.lsp.buf.signature_help()<CR>" (do (set opts.desc "show signature help") opts))
                                (nset bufnr :n :<space>a "<Cmd>lua vim.lsp.buf.format()<CR>" (do (set opts.desc "run code formatter") opts))))]

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
                 :init_options {:usePlaceholders true}})))}]
