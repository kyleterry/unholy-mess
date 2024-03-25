; (let [ls (require :luasnip)
;       snip (require :luasnip.snippet)
;       tnode (require :luasnip.text_node)
;       fnode (require :luasnip.function_node)
;       go-snippets [(snip {:trig :iferr
;                           :name :iferr
;                           :dscr "create err != nil check"}
;                          {1 (t "if err != nil")})]
;   (ls.add_snippets :go go-snippets))
