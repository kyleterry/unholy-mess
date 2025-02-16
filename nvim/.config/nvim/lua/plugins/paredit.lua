-- [nfnl] Compiled from fnl/plugins/paredit.fnl by https://github.com/Olical/nfnl, do not edit.
local fun = require("config.fun")
local lisps = {"scheme", "lisp", "fennel", "racket", "clojure"}
local function _1_()
  local autopairs = require("nvim-autopairs")
  autopairs.setup({ignore_next_char = "", enable_check_bracket_line = false})
  fun.head(autopairs.get_rules("'"))["not_filetypes"] = lisps
  fun.head(autopairs.get_rules("`"))["not_filetypes"] = lisps
  return nil
end
local function _2_()
  local paredit = require("nvim-paredit")
  local function _3_()
    return paredit.cursor.place_cursor(paredit.wrap.wrap_element_under_cursor("( ", ")"), {placement = "inner_start", mode = "insert"})
  end
  local function _4_()
    return paredit.cursor.place_cursor(paredit.wrap.wrap_element_under_cursor("(", ")"), {placement = "inner_end", mode = "insert"})
  end
  return paredit.setup({keys = {["<A-H>"] = {paredit.api.slurp_backwards, "Slurp backwards"}, ["<A-J>"] = {paredit.api.barf_backwards, "Barf backwards"}, ["<A-K>"] = {paredit.api.barf_forwards, "Barf forwards"}, ["<A-L>"] = {paredit.api.slurp_forwards, "Slurp forwards"}, ["<localleader>w"] = {_3_, "Wrap element insert head"}, ["<localleader>W"] = {_4_, "Wrap element insert tail"}}, indent = {enabled = true}})
end
local function _5_()
  local surround = require("nvim-surround")
  return surround.setup()
end
return {{"windwp/nvim-autopairs", event = "InsertEnter", config = _1_, lazy = false}, {"julienvincent/nvim-paredit", ft = lisps, config = _2_, lazy = false}, {"kylechui/nvim-surround", event = "VeryLazy", config = _5_}}
