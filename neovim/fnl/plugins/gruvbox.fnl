(local gruvbox-config {})

[{1 :ellisonleao/gruvbox.nvim
  :priority 1000
  :config (fn []
            (let [theme (require :gruvbox)]
              (theme.setup gruvbox-config)
              (vim.cmd "colorscheme gruvbox")))}]
