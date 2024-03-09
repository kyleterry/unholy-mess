; tpope plugins. our god. our savior.
; a man so prevalent, he gets his own plugin file.
; TODO: add more tpope
(let [plugins
      [:tpope/vim-abolish
       :tpope/vim-commentary
       :tpope/vim-dadbod
       :tpope/vim-fugitive
       :tpope/vim-sensible
       :tpope/vim-surround
       :tpope/vim-unimpaired
       :tpope/vim-vinegar
       ]
      tbl []]
  (each [_ plugin (ipairs plugins)]
    (table.insert tbl {1 plugin :lazy false}))
  tbl)
