[{1 :folke/which-key.nvim
  :event :VeryLazy
  :opts {:plugins {:marks true
                   :registers true
                   :spelling {:enabled true :suggestions 10}}
         :icons {:separator "->" :breadcrumb ">>" :mappings false}}
  ; :init (fn []
  ;         (do
  ;           (tset vim.opt :timeout true)
  ;           (tset vim.opt :timeoutlen 300)
  ;           (let [wk (require :which-key)
  ;                 plugins {:marks true
  ;                          :registers true
  ;                          :spelling {:enabled true}}
  ;                 ;window {:border :none :position :bottom :margin [0 0 0 0] :padding [0 0 0 0]}
  ;                 ;window {:border :none :position :bottom :padding [0 0 0 0]}
  ;                 icons {:separator "->" :breakcrumb ">>"}]
  ;             (wk.setup {: plugins : icons}))))
  :keys [{1 :<leader>?
          2 (fn []
              (let [wk (require :which-key)]
                (wk.show {:global false})))
          :desc "Show buffer local keymaps"}]}]
