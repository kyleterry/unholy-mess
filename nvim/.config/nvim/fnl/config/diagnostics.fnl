(import-macros {: map} :config.macros)

(vim.diagnostic.config {:virtual_text false
                        :signs true
                        :float {:header ""
                                :prefix ""
                                :source :if_many
                                :focusable false
                                :border :single
                                :title "Diagnostic:"
                                :title_pos :left}})

(map :n :<space>e
     #(vim.diagnostic.open_float 0
                                 {:scope :line
                                  :close_events [:BufLeave
                                                 :CursorMoved
                                                 :InsertEnter
                                                 :FocusLost]})
     {:noremap true :silent true})

(map :n :<space>lQ vim.diagnostic.setqflist {:noremap true :silent true})
(map :n :<space>lq vim.diagnostic.setloclist {:noremap true :silent true})
(map :n "[e" vim.diagnostic.goto_prev {:noremap true :silent true})
(map :n "]e" vim.diagnostic.goto_next {:noremap true :silent true})
