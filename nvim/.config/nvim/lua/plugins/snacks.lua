-- [nfnl] Compiled from fnl/plugins/snacks.fnl by https://github.com/Olical/nfnl, do not edit.
local function _1_()
  return Snacks.terminal()
end
local function _2_()
  return Snacks.scratch()
end
return {{"folke/snacks.nvim", priority = 1000, opts = {terminal = {}, scratch = {}, statuscolumn = {}}, keys = {{"<leader>tt", _1_, desc = "Toggle terminal"}, {"<leader>sp", _2_, desc = "Toggle scratchpad"}}, lazy = false}}
