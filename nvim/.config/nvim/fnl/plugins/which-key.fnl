[{1 :folke/which-key.nvim
  :event :VeryLazy
  :init (fn []
          (do
            (tset vim.opt :timeout true)
            (tset vim.opt :timeoutlen 300)
            (let [wk (require :which-key)
                  plugins {:marks true :registers true :spelling {:enabled true}}
                  window {:border :none :position :bottom :margin [0 0 0 0] :padding [0 0 0 0]}
                  icons {:separator :-> :breakcrumb :>>}]
              (wk.setup {: window
                         : plugins
                         : icons}))))}]
