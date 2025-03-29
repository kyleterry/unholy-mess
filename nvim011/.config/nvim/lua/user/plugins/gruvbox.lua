-- [nfnl] Compiled from fnl/user/plugins/gruvbox.fnl by https://github.com/Olical/nfnl, do not edit.
local function _1_()
  local gruvbox = require("gruvbox")
  local gruvbox_colors = gruvbox.palette
  local gruvbox_bg_soft = gruvbox_colors.dark0_soft
  local gruvbox_fg_soft = gruvbox_colors.light1
  local gruvbox_config = {terminal_colors = true, contrast = "hard", italic = {comments = false, emphasis = false, folds = false, operators = false, strings = false}, overrides = {CursorLine = {bg = gruvbox_bg_soft}, StatusLine = {fg = gruvbox_fg_soft, bg = gruvbox_bg_soft}, SignColumn = {link = "Normal"}, GruvboxGreenSign = {bg = ""}, GruvboxOrangeSign = {bg = ""}, GruvboxPurpleSign = {bg = ""}, GruvboxYellowSign = {bg = ""}, GruvboxRedSign = {bg = ""}, GruvboxBlueSign = {bg = ""}, GruvboxAquaSign = {bg = ""}}, invert_signs = false, transparent_mode = false}
  gruvbox.setup(gruvbox_config)
  vim.cmd("set background=dark")
  return vim.cmd("colorscheme gruvbox")
end
return {{"ellisonleao/gruvbox.nvim", priority = 1000, config = _1_}}
