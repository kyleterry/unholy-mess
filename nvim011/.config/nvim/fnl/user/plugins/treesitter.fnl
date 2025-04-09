[{1 :nvim-treesitter/nvim-treesitter
  :build ":TSUpdate"
  :main :nvim-treesitter.configs
  :opts {:highlight {:enable true
                     :disable [:markdown]
                     :additional_vim_regex_highlighting false}
         :indent {:enable true :disable [:html :markdown]}
         :incremental_selection {:enable true
                                 :keymaps {:init_selection :<c-space>
                                           :node_decremental :<m-space>
                                           :node_incremental :<c-space>
                                           :scope_incremental :<c-s>}}
         :select {:enable true}
         :auto_install true
         :ensure_installed [:vimdoc
                            :bash
                            :scheme
                            :go
                            :gomod
                            :gowork
                            :gosum
                            :gdscript
                            :python
                            :fennel
                            :terraform
                            :json
                            :lua
                            :markdown
                            :yaml]}}
 {1 :nvim-treesitter/nvim-treesitter-textobjects
  :dependencies [:nvim-treesitter/nvim-treesitter]}]
