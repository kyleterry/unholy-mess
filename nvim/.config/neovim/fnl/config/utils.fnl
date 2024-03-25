(local vim vim)

(local opts {})

(tset opts :default {:noremap true :unique true})

(tset opts :silent {:noremap true
                    :silent true
                    :unique true})

(tset opts :expr {:noremap true
                  :unique true
                  :expr true
                  :replace_keycodes false})

(fn opt [key value]
  "Set a vim option"
  (tset vim.opt key value))

(fn g [key value]
  "Set a vim option"
  (tset vim.g key value))

(fn keymap [mode key command opts]
  (vim.api.nvim_set_keymap mode key command opts))

{: opt
 : g
 : keymap
 :opts opts}
