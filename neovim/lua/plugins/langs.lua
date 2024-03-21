-- [nfnl] Compiled from fnl/plugins/langs.fnl by https://github.com/Olical/nfnl, do not edit.
local function _1_()
  local headlines = require("headlines")
  return headlines.setup({})
end
return {{"bakpakin/fennel.vim", lazy = true, ft = {"fennel"}}, {"wlangstroth/vim-racket", lazy = true, ft = {"racket"}}, {"fatih/vim-go", lazy = true, build = ":GoUpdateBinaries", ft = {"go"}}, {"ray-x/go.nvim", lazy = true}, {"hashivim/vim-terraform", lazy = true, ft = {"terraform"}}, {"habamax/vim-godot", lazy = true, ft = {"gdscript"}}, {"PotatoesMaster/i3-vim-syntax", lazy = true, ft = {"i3"}}, {"lukas-reineke/headlines.nvim", lazy = true, config = _1_}}
