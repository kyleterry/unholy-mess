-- [nfnl] Compiled from fnl/plugins/langs.fnl by https://github.com/Olical/nfnl, do not edit.
local function _1_()
  local csharp = require("csharp")
  return csharp.setup({})
end
local function _2_()
  local headlines = require("headlines")
  return headlines.setup({})
end
return {{"bakpakin/fennel.vim", lazy = true, ft = {"fennel"}}, {"wlangstroth/vim-racket", lazy = true, ft = {"racket"}}, {"fatih/vim-go", lazy = true, build = ":GoUpdateBinaries", ft = {"go"}}, {"ray-x/go.nvim", lazy = true}, {"hashivim/vim-terraform", lazy = true, ft = {"terraform"}}, {"habamax/vim-godot", lazy = true, ft = {"gdscript"}}, {"iabdelkareem/csharp.nvim", lazy = true, dependencies = {"williamboman/mason.nvim", "mfussenegger/nvim-dap", "Tastyep/structlog.nvim"}, ft = {"cs"}, config = _1_}, {"hat0uma/csvview.nvim", lazy = true, ft = {"csv"}}, {"jamespeapen/swayconfig.vim", lazy = true, ft = {"swayconfig"}}, {"gentoo/gentoo-syntax", lazy = false}, {"lukas-reineke/headlines.nvim", lazy = true, config = _2_}}
