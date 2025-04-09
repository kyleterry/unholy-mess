(local mod {:opts {}})

(tset mod.opts :default {:noremap true :unique true})
(tset mod.opts :default-silent {:noremap true :unique true :silent true})

(fn mod.keymap [mode key command opts]
  (vim.keymap.set mode key command opts))

(fn mod.lazy-keymap [key func desc]
  {1 key 2 func : desc})

mod
