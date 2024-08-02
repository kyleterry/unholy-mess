[{1 :nvim-treesitter/nvim-treesitter
  :build ":TSUpdate"
  :config (fn []
            (let [treesitter (require :nvim-treesitter.configs)
                  defaults [:vimdoc :bash :scheme :go :gomod :gowork :gosum :gdscript :python :fennel :json :lua :markdown :yaml]]
              (treesitter.setup {:highlight {:enable true
                                             :disable [:markdown]
                                             :additional_vim_regex_highlighting false}
                                 :indent {:enable true
                                          :disable [:html :markdown]}
                                 :incremental_selection {:enable true
                                                         :keymaps {:init_selection :<c-space>
                                                                   :node_decremental :<m-space>
                                                                   :node_incremental :<c-space>
                                                                   :scope_incremental :<c-s>}}
                                 :select {:enable true}
                                 :auto_install true
                                 :ensure_installed defaults})))}]
