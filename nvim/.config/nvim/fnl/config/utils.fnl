(local mod {:opts {}})

(tset mod.opts :default {:noremap true :unique true})
(tset mod.opts :silent {:noremap true :silent true :unique true})
(tset mod.opts :expr {:noremap true
                      :unique true
                      :expr true
                      :replace_keycodes false})

(fn mod.opt [key value]
  "Set a vim option"
  (tset vim.opt key value))

(fn mod.g [key value]
  "Set a vim option"
  (tset vim.g key value))

(fn mod.keymap [mode key command opts]
  (vim.api.nvim_set_keymap mode key command opts))

mod
