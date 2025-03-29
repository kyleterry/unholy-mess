{1 :stevearc/conform.nvim
 :event [:BufReadPre :BufNewFile]
 :opts {:formatters_by_ft {:fennel [:fnlfmt]
                           :go [:gofumpt]
                           :lua [:stylua]
                           :tf [:tfmt]
                           :terraform [:tfmt]
                           :hcl [:tfmt]}
        :format_on_save {:lsp_fallback true :async false :timeout_ms 500}
        :formatters {:tfmt {:command :tofu :args [:fmt "-"] :stdin true}}}}
