(local lisps [:scheme :fennel :lisp :racket :clojure])

[{1 :windwp/nvim-autopairs
  :lazy false
  :opts {:ignore_next_char "" :enable_check_bracket_line false}}
 {1 :kylechui/nvim-surround :event :VeryLazy}
 {1 :julienvincent/nvim-paredit
  :lazy false
  :ft lisps
  :opts #(let [paredit (require :nvim-paredit)]
           {:keys {:<A-H> [paredit.api.slurp_backwards "Slurp backwards"]
                   :<A-J> [paredit.api.barf_backwards "Barf backwards"]
                   :<A-K> [paredit.api.barf_forwards "Barf forwards"]
                   :<A-L> [paredit.api.slurp_forwards "Slurp forwards"]
                   :<localleader>wf [#(paredit.cursor.place_cursor (paredit.wrap.wrap_enclosing_form_under_cursor "("
                                                                                                                  ")")
                                                                   {:placement :inner_start
                                                                    :mode :insert})
                                     "Wrap form insert head"]
                   :<localleader>we [#(paredit.cursor.place_cursor (paredit.wrap.wrap_element_under_cursor "( "
                                                                                                           ")")
                                                                   {:placement :inner_start
                                                                    :mode :insert})
                                     "Wrap element insert head"]
                   :<localleader>W [#(paredit.cursor.place_cursor (paredit.wrap.wrap_element_under_cursor "("
                                                                                                          ")")
                                                                  {:placement :inner_end
                                                                   :mode :insert})
                                    "Wrap element insert tail"]}
            :indent {:enabled true}})}]
