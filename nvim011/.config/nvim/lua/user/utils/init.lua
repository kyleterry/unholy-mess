-- [nfnl] Compiled from fnl/user/utils/init.fnl by https://github.com/Olical/nfnl, do not edit.
local mod = {opts = {}}
mod.opts["default"] = {noremap = true, unique = true}
mod.opts["default-silent"] = {noremap = true, unique = true, silent = true}
mod.keymap = function(mode, key, command, opts)
  return vim.keymap.set(mode, key, command, opts)
end
mod["lazy-keymap"] = function(key, func, desc)
  return {key, func, desc = desc}
end
return mod
