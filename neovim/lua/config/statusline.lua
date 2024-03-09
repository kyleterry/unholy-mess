-- [nfnl] Compiled from fnl/config/statusline.fnl by https://github.com/Olical/nfnl, do not edit.
local function statusline()
  return table.concat({"%#PmenuSel#", "%{FugitiveStatusline()}", "%#StatusLine#", " %f", "%=", "%y", " %{&fileencoding?&fileencoding:&encoding}", "%r", " %p%%", " %l,%c"})
end
local function setup()
  vim.opt.statusline = "%!v:lua.require'config.statusline'.statusline()"
  return nil
end
return {statusline = statusline, setup = setup}
