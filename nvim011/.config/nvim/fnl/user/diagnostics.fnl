(local {: autoload} (require :nfnl.module))
(local core (autoload :nfnl.core))
(local {: keymap : opts} (require :user.utils))

(vim.diagnostic.config {:virtual_text true
                        :virtual_lines false
                        :signs true
                        :float {:header ""
                                :prefix ""
                                :source :if_many
                                :focusable false
                                :border :single
                                :title "Diagnostic:"
                                :title_pos :left}})

(keymap :n :<space>e
        #(vim.diagnostic.open_float 0
                                    {:scope :line
                                     :close_events [:BufLeave
                                                    :CursorMoved
                                                    :InsertEnter
                                                    :FocusLost]})
        {:noremap true :silent true})

(keymap :n :<space>lQ vim.diagnostic.setqflist {:noremap true :silent true})
(keymap :n :<space>lq vim.diagnostic.setloclist {:noremap true :silent true})
(keymap :n "[e" vim.diagnostic.goto_prev {:noremap true :silent true})
(keymap :n "]e" vim.diagnostic.goto_next {:noremap true :silent true})
