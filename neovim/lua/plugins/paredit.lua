-- [nfnl] Compiled from fnl/plugins/paredit.fnl by https://github.com/Olical/nfnl, do not edit.
local _local_1_ = require("nfnl.module")
local autoload = _local_1_["autoload"]
local nvim = autoload("nvim")
local lisps = {"scheme", "lisp", "clojure", "fennel", "racket"}
local function _2_()
  local autopairs = require("nvim-autopairs")
  return autopairs.setup({ignore_next_char = "", enable_check_bracket_line = false})
end
local function _3_()
  local paredit = require("nvim-paredit")
  local paredit_fennel = require("nvim-paredit-fennel")
  local paredit_scheme = require("nvim-paredit-scheme")
  local function _4_()
    return paredit.cursor.place_cursor(paredit.wrap.wrap_element_under_cursor("( ", ")"), {placement = "inner_start", mode = "insert"})
  end
  local function _5_()
    return paredit.cursor.place_cursor(paredit.wrap.wrap_element_under_cursor("(", ")"), {placement = "inner_end", mode = "insert"})
  end
  paredit.setup({keys = {["<A-H>"] = {paredit.api.slurp_backwards, "Slurp backwards"}, ["<A-J>"] = {paredit.api.barf_backwards, "Barf backwards"}, ["<A-K>"] = {paredit.api.barf_forwards, "Barf forwards"}, ["<A-L>"] = {paredit.api.slurp_forwards, "Slurp forwards"}, ["<localleader>w"] = {_4_, "Wrap element insert head"}, ["<localleader>W"] = {_5_, "Wrap element insert tail"}}, indent = {enabled = true}})
  paredit_fennel.setup({})
  return paredit_scheme.setup(paredit)
end
local function _6_()
  local surround = require("nvim-surround")
  return surround.setup()
end
return {{"windwp/nvim-autopairs", event = "InsertEnter", config = _2_, lazy = false}, {"julienvincent/nvim-paredit", dependencies = {"julienvincent/nvim-paredit-fennel", "ekaitz-zarraga/nvim-paredit-scheme"}, ft = lisps, config = _3_, lazy = false}, {"kylechui/nvim-surround", event = "VeryLazy", config = _6_}}
