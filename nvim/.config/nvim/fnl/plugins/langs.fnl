[{1 :bakpakin/fennel.vim
  :lazy true
  :ft [:fennel]}
 {1 :wlangstroth/vim-racket
  :lazy true
  :ft [:racket]}
 {1 :fatih/vim-go
  :lazy true
  :build ":GoUpdateBinaries"
  :ft [:go]}
 {1 :ray-x/go.nvim
  :lazy true}
 {1 :hashivim/vim-terraform
  :lazy true
  :ft [:terraform]}
 {1 :habamax/vim-godot
  :lazy true
  :ft [:gdscript]}
 {1 :iabdelkareem/csharp.nvim
  :lazy true
  :dependencies [:williamboman/mason.nvim
                 :mfussenegger/nvim-dap
                 :Tastyep/structlog.nvim]
  :ft [:cs]
  :config (fn []
            (let [csharp (require :csharp)]
              (csharp.setup {})))}
 {1 :PotatoesMaster/i3-vim-syntax
  :lazy true
  :ft [:i3]}
 {1 :lukas-reineke/headlines.nvim
  :lazy true
  :config (fn []
            (let [headlines (require :headlines)]
              (headlines.setup {})))}]
