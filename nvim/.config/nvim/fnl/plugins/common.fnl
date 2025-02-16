(local {: autoload} (require :nfnl.module))
(local nvim (autoload :nvim))

(let [km vim.keymap.set
      plugins {:olical/nfnl {}
               :mbbill/undotree {:config (fn []
                                           (km :n :<leader>u
                                               vim.cmd.UndotreeToggle
                                               {:desc "undotree toggle"}))}
               :olical/conjure {:branch :master
                                :init (fn []
                                        (set nvim.g.conjure#log#hud#enabled
                                             false)
                                        (set nvim.g.conjure#mapping#doc_word :K)
                                        (set nvim.g.conjure#filetype#fennel
                                             :conjure.client.fennel.stdio)
                                        (set nvim.g.conjure#client#scheme#stdio#command
                                             "gerbil interactive")
                                        (set nvim.g.conjure#client#scheme#stdio#prompt_pattern
                                             "> $?")
                                        (set nvim.g.conjure#client#racket#stdio#command
                                             :racket)
                                        (set nvim.g.conjure#client#clojure#nrepl#eval#auto_require
                                             false)
                                        (set nvim.g.conjure#client#clojure#nrepl#connection#auto_repl#enabled
                                             false))}
               ; theme
               :ellisonleao/gruvbox.nvim {:priority 1000
                                          :config (fn []
                                                    (let [theme (require :gruvbox)]
                                                      (theme.setup {})
                                                      (vim.cmd "colorscheme gruvbox")))}
               ; folke hero
               :folke/todo-comments {:opts {:signs false}}
               :folke/which-key.nvim {:event :VeryLazy
                                      :init (fn []
                                              (do
                                                (tset vim.opt :timeout true)
                                                (tset vim.opt :timeoutlen 300)
                                                (let [wk (require :which-key)
                                                      plugins {:marks true
                                                               :registers true
                                                               :spelling {:enabled true}}
                                                      window {:border :none
                                                              :position :bottom
                                                              :margin [0 0 0 0]
                                                              :padding [0
                                                                        0
                                                                        0
                                                                        0]}
                                                      icons {:separator "->"
                                                             :breakcrumb ">>"}]
                                                  (wk.setup {: window
                                                             : plugins
                                                             : icons}))))}
               ; tpope. our god. our lord. our savior.
               ; a man so prevalent, he gets his own plugin section.
               :tpope/vim-abolish {}
               :tpope/vim-commentary {}
               :tpope/vim-dadbod {}
               :tpope/vim-sensible {}
               :tpope/vim-surround {}
               :tpope/vim-unimpaired {}
               :tpope/vim-vinegar {}
               ; languages
               :bakpakin/fennel.vim {:lazy true :ft [:fennel]}
               :wlangstroth/vim-racket {:lazy true :ft [:racket]}
               :fatih/vim-go {:lazy true :build ":GoUpdateBinaries" :ft [:go]}
               :ray-x/go.nvim {:lazy true}
               :hashivim/vim-terraform {:lazy true :ft [:terraform]}
               :habamax/vim-godot {:lazy true :ft [:gdscript]}
               :jamespeapen/swayconfig.vim {:lazy true :ft [:swayconfig :sway]}
               ; tools
               :codethread/qmk.nvim {:config (fn []
                                               (let [qmk (require :qmk)]
                                                 (qmk.setup {})))}
               :kawre/leetcode.nvim {:dependencies [:muniftanjim/nui.nvim]
                                     :opts {:lang :go}}}]
  {})

[{1 :mbbill/undotree
  :config (fn []
            (vim.keymap.set :n :<leader>u vim.cmd.UndotreeToggle
                            {:desc "undotree toggle"}))}
 {1 :kawre/leetcode.nvim
  :dependencies [:muniftanjim/nui.nvim]
  :opts {:lang :go}}
 {1 :airblade/vim-gitgutter}]
