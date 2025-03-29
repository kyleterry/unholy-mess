-- [nfnl] Compiled from fnl/user/plugins/pairs.fnl by https://github.com/Olical/nfnl, do not edit.
local lisps = {"scheme", "fennel", "lisp", "racket", "clojure"}
local function _1_()
  local paredit = require("nvim-paredit")
  local function _2_()
    return paredit.cursor.place_cursor(paredit.wrap.wrap_enclosing_form_under_cursor("(", ")"), {placement = "inner_start", mode = "insert"})
  end
  local function _3_()
    return paredit.cursor.place_cursor(paredit.wrap.wrap_element_under_cursor("( ", ")"), {placement = "inner_start", mode = "insert"})
  end
  local function _4_()
    return paredit.cursor.place_cursor(paredit.wrap.wrap_element_under_cursor("(", ")"), {placement = "inner_end", mode = "insert"})
  end
  return {keys = {["<A-H>"] = {paredit.api.slurp_backwards, "Slurp backwards"}, ["<A-J>"] = {paredit.api.barf_backwards, "Barf backwards"}, ["<A-K>"] = {paredit.api.barf_forwards, "Barf forwards"}, ["<A-L>"] = {paredit.api.slurp_forwards, "Slurp forwards"}, ["<localleader>wf"] = {_2_, "Wrap form insert head"}, ["<localleader>we"] = {_3_, "Wrap element insert head"}, ["<localleader>W"] = {_4_, "Wrap element insert tail"}}, indent = {enabled = true}}
end
return {{"windwp/nvim-autopairs", opts = {ignore_next_char = "", enable_check_bracket_line = false}, lazy = false}, {"kylechui/nvim-surround", event = "VeryLazy"}, {"julienvincent/nvim-paredit", ft = lisps, opts = _1_, lazy = false}}
