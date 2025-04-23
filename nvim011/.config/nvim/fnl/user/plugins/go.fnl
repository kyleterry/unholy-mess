{1 :ray-x/go.nvim
 :dependencies [:ray-x/guihua.lua]
 :event :CmdlineEnter
 :ft [:go :gomod]
 :opts {:verbose true}
 :build #((. (require :go.install) :update_all_sync))}
