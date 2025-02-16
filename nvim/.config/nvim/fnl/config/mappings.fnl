(local {: keymap} (require :config.utils))
(local opts {:noremap true :unique true :silent true})

; kills the highlight search
(keymap :n :<leader><space> ":nohlsearch<cr>" opts)

; keeps selection when indenting
(keymap :v ">" :><cr>gv opts)
(keymap :v "<" :<<cr>gv opts)

; allows moving selected lines up and down
(keymap :v :J ":m '>+1<cr>gv=gv" opts)
(keymap :v :K ":m '<-2<cr>gv=gv" opts)

; move between split windows
(keymap :n :<c-j> :<c-w>j {})
(keymap :n :<c-k> :<c-w>k {})
(keymap :n :<c-l> :<c-w>l {})
(keymap :n :<c-h> :<c-w>h {})

; keeps the cursor in the middle of the screen when page scrolling
(keymap :n :<c-d> :<c-d>zz {})
(keymap :n :<c-u> :<c-u>zz {})

; keep the cursor in the same position when navigating search results
(keymap :n :n :nzzzv {})
(keymap :n :N :Nzzzx {})

; don't clobber my paste buffer
(keymap :x :<leader>p "\"_dP" {})

; yank to clipboard
(keymap :n :<leader>cy "\"+y" {:desc "yank to clipboard"})
(keymap :v :<leader>cy "\"+y" {:desc "yank to clipboard"})
(keymap :n :<leader>cY "\"+Y" {:desc "yank paragraph to clipboard"})

; paste from clipboard
(keymap :n :<leader>cp "\"+p" {:desc "paste from clipboard"})

; quicklist navigation
(keymap :n :<leader>qk :<cmd>cnext<cr>zz {:desc "quickfix next"})
(keymap :n :<leader>qj :<cmd>cprev<cr>zz {:desc "quickfix previous"})
