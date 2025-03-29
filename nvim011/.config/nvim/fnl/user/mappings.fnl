(local {: autoload} (require :nfnl.module))
(local core (autoload :nfnl.core))
(local {: keymap : opts} (require :user.utils))

(keymap :n :<leader><space> ":nohlsearch<cr>"
        (core.merge opts.default-silent {:desc "cancel search highlighting"}))

(keymap :n :<c-j> :<c-w>j {})
(keymap :n :<c-k> :<c-w>k {})
(keymap :n :<c-l> :<c-w>l {})
(keymap :n :<c-h> :<c-w>h {})

(keymap :n :<leader>cy "\"+y" {:desc "yank to clipboard"})
(keymap :v :<leader>cy "\"+y" {:desc "yank to clipboard"})
(keymap :n :<leader>cY "\"+Y" {:desc "yank paragraph to clipboard"})

