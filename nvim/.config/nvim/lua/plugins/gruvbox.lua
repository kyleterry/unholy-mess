-- [nfnl] Compiled from fnl/plugins/gruvbox.fnl by https://github.com/Olical/nfnl, do not edit.
local function _1_()
  vim.cmd("set background=dark")
  vim.cmd("let g:gruvbox_material_background = 'hard'")
  return vim.cmd("colorscheme gruvbox-material")
end
return {{"sainnhe/gruvbox-material", priority = 1000, config = _1_}}
