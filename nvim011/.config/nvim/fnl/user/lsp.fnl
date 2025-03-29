(local lsp vim.lsp)

(lsp.config "*"
            {:capabilities ((. (require :blink.cmp) :get_lsp_capabilities))})

(set lsp.config.gopls {:cmd [:gopls]
                       :root_markers [:go.mod]
                       :filetypes [:go :gomod]})

;
; (set lsp.config.goimports {:cmd [:goimports]
;                            :root_markers [:go.mod]
;                            :filetypes [:go :gomod]})

(set lsp.config.luals
     {:cmd [:lua-language-server]
      :root_markers [:.luarc.json :.luarc.jsonc]
      :filetypes [:lua]
      :settings {:Lua {:runtime {:version :LuaJIT}}}})

(lsp.enable [:gopls :goimports :luals])

(vim.api.nvim_create_autocmd :LspAttach
                             {:callback (fn [ev]
                                          (let [client (lsp.get_client_by_id ev.data.client_id)]
                                            (when (client:supports_method :textDocument/completion)
                                              (lsp.completion.enable true
                                                                     client.id
                                                                     ev.buf
                                                                     {:autotrigger true}))))})
