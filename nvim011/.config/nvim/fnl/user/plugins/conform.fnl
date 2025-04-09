; Mapping of filetypes to their formatters
(local ft->formatters {:fennel [:fnlfmt]
                       :go [:gofumpt :goimports]
                       :lua [:stylua]
                       :tf [:tfmt]
                       :terraform [:tfmt]
                       :hcl [:tfmt]})

; Custom formatters. For instance, using tofu fmt for terraform filetypes.
(local formatters {:tfmt {:command :tofu :args [:fmt "-"] :stdin true}})

{1 :stevearc/conform.nvim
 :event [:BufReadPre :BufNewFile]
 :opts {:formatters_by_ft ft->formatters
        :format_on_save {:lsp_fallback true :async false :timeout_ms 500}
        : formatters}}
