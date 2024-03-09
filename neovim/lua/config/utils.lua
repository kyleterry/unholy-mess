-- [nfnl] Compiled from fnl/config/utils.fnl by https://github.com/Olical/nfnl, do not edit.
local vim = vim
local opts = {}
opts["default"] = {noremap = true, unique = true}
opts["silent"] = {noremap = true, silent = true, unique = true}
opts["expr"] = {noremap = true, unique = true, expr = true, replace_keycodes = false}
local function opt(key, value)
  vim.opt[key] = value
  return nil
end
local function g(key, value)
  vim.g[key] = value
  return nil
end
local function keymap(mode, key, command, opts0)
  return vim.api.nvim_set_keymap(mode, key, command, opts0)
end
return {opt = opt, g = g, keymap = keymap, opts = opts}
