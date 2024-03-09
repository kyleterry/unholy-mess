[{1 :nvim-treesitter/nvim-treesitter
  :build ":TSUpdate"
  :config (fn []
            (let [treesitter (require :nvim-treesitter.configs)
                  defaults [:bash :scheme :go :gomod :gowork :gosum :gdscript :python :fennel :json :lua :markdown :yaml]]
              (treesitter.setup {:highlight {:enable true}
                                 :indent {:enable true}
                                 :ensure_installed defaults})))}]
