-- [nfnl] Compiled from fnl/plugins/tpope.fnl by https://github.com/Olical/nfnl, do not edit.
local plugins = {"tpope/vim-abolish", "tpope/vim-commentary", "tpope/vim-dadbod", "tpope/vim-fugitive", "tpope/vim-sensible", "tpope/vim-surround", "tpope/vim-unimpaired", "tpope/vim-vinegar"}
local tbl = {}
for _, plugin in ipairs(plugins) do
  table.insert(tbl, {plugin, lazy = false})
end
return tbl
