(local {: lazy-keymap} (require :user.utils))

{1 :folke/which-key.nvim
 :event :VeryLazy
 :opts {:plugins {:marks true
                  :registers true
                  :spelling {:enabled true :suggestions 10}}
        :icons {:separator "->" :breadcrumb ">>" :mappings false}}
 :keys [(lazy-keymap :<leader>?
                     #((. (require :which-key) :show) {:global false})
                     "show buffer local keymaps")]}
