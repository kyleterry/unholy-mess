[{1 :Saghen/blink.cmp
  :version "*"
  :dependencies [:rafamadriz/friendly-snippets]
  :opts {:keymap {:preset :default}
         :cmdline {:enabled true :keymap {:preset :cmdline}}
         :completion {:list {:selection {:auto_insert true}}
                      :menu {:draw {:columns {1 {1 :label
                                                 2 :label_description
                                                 :gap 1}
                                              2 [:kind]}}}
                      :documentation {:auto_show true}
                      :ghost_text {:enabled true}}
         :sources {:default [:lsp :snippets :path :buffer]}
         :signature {:enabled true}}}]

