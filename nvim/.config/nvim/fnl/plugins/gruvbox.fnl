; (local gruvbox-config {})

; [{1 :ellisonleao/gruvbox.nvim
;   :priority 1000
;   :config (fn []
;             (let [theme (require :gruvbox)]
;               (theme.setup gruvbox-config)
;               (vim.cmd "colorscheme gruvbox")))}]
[{1 :sainnhe/gruvbox-material
  :priority 1000
  :config (fn []
            (do
            ; (let [theme (require :gruvbox-material)]
              ; (theme.setup gruvbox-config)
              (vim.cmd "set background=dark")
              (vim.cmd "let g:gruvbox_material_background = 'hard'")
              (vim.cmd "colorscheme gruvbox-material")))}]
