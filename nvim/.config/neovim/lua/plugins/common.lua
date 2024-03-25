-- [nfnl] Compiled from fnl/plugins/common.fnl by https://github.com/Olical/nfnl, do not edit.
local _local_1_ = require("nfnl.module")
local autoload = _local_1_["autoload"]
local nvim = autoload("nvim")
local nfnl_core = autoload("nfnl.core")
do
  local km = vim.keymap.set
  local plugins
  local function _2_()
    return km("n", "<leader>u", vim.cmd.UndotreeToggle, {desc = "undotree toggle"})
  end
  local function _3_()
    nvim.g["conjure#log#hud#enabled"] = false
    nvim.g["conjure#mapping#doc_word"] = "K"
    nvim.g["conjure#filetype#fennel"] = "conjure.client.fennel.stdio"
    nvim.g["conjure#client#scheme#stdio#command"] = "gerbil interactive"
    nvim.g["conjure#client#scheme#stdio#prompt_pattern"] = "> $?"
    nvim.g["conjure#client#racket#stdio#command"] = "racket"
    nvim.g["conjure#client#clojure#nrepl#eval#auto_require"] = false
    nvim.g["conjure#client#clojure#nrepl#connection#auto_repl#enabled"] = false
    return nil
  end
  local function _4_()
    local theme = require("gruvbox")
    theme.setup({})
    return vim.cmd("colorscheme gruvbox")
  end
  local function _5_()
    vim.opt["timeout"] = true
    vim.opt["timeoutlen"] = 300
    local wk = require("which-key")
    local plugins0 = {marks = true, registers = true, spelling = {enabled = true}}
    local window = {border = "none", position = "bottom", margin = {0, 0, 0, 0}, padding = {0, 0, 0, 0}}
    local icons = {separator = "->", breakcrumb = ">>"}
    return wk.setup({window = window, plugins = plugins0, icons = icons})
  end
  local function _6_()
    local qmk = require("qmk")
    return qmk.setup({})
  end
  plugins = {["olical/nfnl"] = {}, ["mbbill/undotree"] = {config = _2_}, ["olical/conjure"] = {branch = "master", init = _3_}, ["ellisonleao/gruvbox.nvim"] = {priority = 1000, config = _4_}, ["folke/todo-comments"] = {opts = {signs = false}}, ["folke/which-key.nvim"] = {event = "VeryLazy", init = _5_}, ["tpope/vim-abolish"] = {}, ["tpope/vim-commentary"] = {}, ["tpope/vim-dadbod"] = {}, ["tpope/vim-fugitive"] = {}, ["tpope/vim-sensible"] = {}, ["tpope/vim-surround"] = {}, ["tpope/vim-unimpaired"] = {}, ["tpope/vim-vinegar"] = {}, ["bakpakin/fennel.vim"] = {lazy = true, ft = {"fennel"}}, ["wlangstroth/vim-racket"] = {lazy = true, ft = {"racket"}}, ["fatih/vim-go"] = {lazy = true, build = ":GoUpdateBinaries", ft = {"go"}}, ["ray-x/go.nvim"] = {lazy = true}, ["hashivim/vim-terraform"] = {lazy = true, ft = {"terraform"}}, ["habamax/vim-godot"] = {lazy = true, ft = {"gdscript"}}, ["potatoesmaster/i3-vim-syntax"] = {lazy = true, ft = {"i3"}}, ["codethread/qmk.nvim"] = {config = _6_}, ["kawre/leetcode.nvim"] = {dependencies = {"muniftanjim/nui.nvim"}, opts = {lang = "go"}}}
  do local _ = {} end
end
local function _7_()
  return vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle, {desc = "undotree toggle"})
end
return {{"mbbill/undotree", config = _7_}, {"kawre/leetcode.nvim", dependencies = {"muniftanjim/nui.nvim"}, opts = {lang = "go"}}, {"airblade/vim-gitgutter"}}
