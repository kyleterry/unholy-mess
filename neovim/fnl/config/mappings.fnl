(local {: keymap} (require :config.utils))
(local opts {:noremap true :unique true :silent true})

(keymap :n :<leader><space> ":nohlsearch<cr>" opts)
(keymap :v ">" "><cr>gv" opts)
(keymap :v "<" "<<cr>gv" opts)

(keymap :n :<c-j> :<c-w>j {})
(keymap :n :<c-k> :<c-w>k {})
(keymap :n :<c-l> :<c-w>l {})
(keymap :n :<c-h> :<c-w>h {})
