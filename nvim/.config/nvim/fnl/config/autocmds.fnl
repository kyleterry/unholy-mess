(let [text-ag (vim.api.nvim_create_augroup :text {:clear true})]
  (vim.api.nvim_create_autocmd [:BufRead :BufNewFile :BufWritePost]
                               {:group text-ag
                                :pattern [:*.md :*.txt :*.tex]
                                :command "setlocal textwidth=80 spell"}))
