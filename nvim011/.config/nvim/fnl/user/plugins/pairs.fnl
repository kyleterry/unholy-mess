; (local {: lazy-keymap} (require :user.utils))
; (local {: autoload} (require :nfnl.module))
; (local paredit (autoload :nvim-paredit))

[{1 :windwp/nvim-autopairs
  :lazy false
  :opts {:ignore_next_char "" :enable_check_bracket_line false}}
 ; {1 :kylechui/nvim-surround :event :VeryLazy}
 {1 :julienvincent/nvim-paredit
  :lazy false
  :ft [:fennel :scheme :lisp :racket]
  :opts {:indent {:enabled true}}}]

; :keys #(let [paredit (require :nvim-paredit)]
;          [(lazy-keymap :<A-H> paredit.api.slurp_backwards "Slurp backwards")
;           (lazy-keymap :<A-J> paredit.api.barf_backwards "Barf backwards")
;           (lazy-keymap :<A-K> paredit.api.barf_forwards "Barf forwards")
;           (lazy-keymap :<A-L> paredit.api.slurp_forwards "Slurp forwards")
;           (lazy-keymap :<localleader>wf
;                        #(paredit.cursor.place_cursor (paredit.wrap.wrap_enclosing_form_under_cursor "("
;                                                                                                     ")")
;                                                      {:placement :inner_start
;                                                       :mode :insert})
;                        "Wrap form insert head")
;           (lazy-keymap :<localleader>we
;                        #(paredit.cursor.place_cursor (paredit.wrap.wrap_element_under_cursor "( "
;                                                                                              ")")
;                                                      {:placement :inner_start
;                                                       :mode :insert})
;                        "Wrap element insert head")
;           (lazy-keymap :<localleader>W
;                        #(paredit.cursor.place_cursor (paredit.wrap.wrap_element_under_cursor "("
;                                                                                              ")")
;                                                      {:placement :inner_end
;                                                       :mode :insert})
;                        "Wrap element insert tail")])}]
