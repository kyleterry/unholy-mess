-- [nfnl] Compiled from fnl/config/utils.fnl by https://github.com/Olical/nfnl, do not edit.
local mod = {opts = {}}
mod.opts["default"] = {noremap = true, unique = true}
mod.opts["silent"] = {noremap = true, silent = true, unique = true}
mod.opts["expr"] = {noremap = true, unique = true, expr = true, replace_keycodes = false}
mod.opt = function(key, value)
  vim.opt[key] = value
  return nil
end
mod.g = function(key, value)
  vim.g[key] = value
  return nil
end
mod.keymap = function(mode, key, command, opts)
  return vim.api.nvim_set_keymap(mode, key, command, opts)
end
return mod
