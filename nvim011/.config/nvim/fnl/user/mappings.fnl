(local {: autoload} (require :nfnl.module))
(local core (autoload :nfnl.core))
(local {: keymap : opts} (require :user.utils))

(keymap :n :<leader><space> ":nohlsearch<cr>"
        (core.merge opts.default-silent {:desc "cancel search highlighting"}))

; keeps selection when indenting
(keymap :v ">" :><cr>gv
        (core.merge opts.default-silent {:desc "indent selection right"}))

(keymap :v "<" :<<cr>gv
        (core.merge opts.default-silent {:desc "indent selection left"}))

; allows moving selected lines up and down
(keymap :v :J ":m '>+1<cr>gv=gv"
        (core.merge opts.default-silent {:desc "move selection up"}))

(keymap :v :K ":m '<-2<cr>gv=gv"
        (core.merge opts.default-silent {:desc "move selection down"}))

(keymap :n :<c-j> :<c-w>j {})
(keymap :n :<c-k> :<c-w>k {})
(keymap :n :<c-l> :<c-w>l {})
(keymap :n :<c-h> :<c-w>h {})

; don't clobber my paste buffer
(keymap :x :<leader>p "\"_dP" {})

(keymap :n :<leader>cy "\"+y" {:desc "yank to clipboard"})
(keymap :v :<leader>cy "\"+y" {:desc "yank to clipboard"})
(keymap :n :<leader>cY "\"+Y" {:desc "yank paragraph to clipboard"})
(keymap :n :<leader>cp "\"+p" {:desc "paste from clipboard"})
