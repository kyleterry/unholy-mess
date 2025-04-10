(vim.lsp.config "*"
                {:capabilities ((. (require :blink.cmp) :get_lsp_capabilities))})

(tset vim.lsp.config :gopls
      {:cmd [:gopls]
       :root_markers [:go.mod]
       :filetypes [:go :gomod]
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
                          :staticcheck true}}})

(tset vim.lsp.config :luals
      {:cmd [:lua-language-server]
       :root_markers [:.luarc.json :.luarc.jsonc]
       :filetypes [:lua]
       :settings {:Lua {:runtime {:version :LuaJIT}}}})

(tset vim.lsp.config :fennel_language_server
      {:cmd [:fennel-language-server]
       :root_markers [:.git]
       :filetypes [:fennel]
       :settings {:fennel {:workspace {:library (vim.api.nvim_list_runtime_paths)
                                       :checkThirdParty false}
                           :diagnostics {:globals [:vim]}}}})

(vim.lsp.enable [:gopls :luals :fennel_language_server])

(vim.api.nvim_create_autocmd :LspAttach
                             {:group (vim.api.nvim_create_augroup :custom.lsp
                                                                  {})
                              :callback (fn [ev]
                                          (let [client (vim.lsp.get_client_by_id ev.data.client_id)]
                                            (when (client:supports_method :textDocument/completion)
                                              (vim.lsp.completion.enable true
                                                                         client.id
                                                                         ev.buf
                                                                         {:autotrigger true}))
                                            (when (and (not (client:supports_method :textDocument/willSaveWaitUntil))
                                                       (client:supports_method :textDocument/formatting))
                                              (vim.api.nvim_create_autocmd :BufWritePre
                                                                           {:group (vim.api.nvim_create_augroup :custom.lsp
                                                                                                                {:clear false})
                                                                            :buffer ev.buf
                                                                            :callback #(vim.lsp.buf.format {:bufnr ev.buf
                                                                                                            :id client.id
                                                                                                            :timeout_ms 1000})}))))})
