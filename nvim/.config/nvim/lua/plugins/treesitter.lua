-- [nfnl] Compiled from fnl/plugins/treesitter.fnl by https://github.com/Olical/nfnl, do not edit.
local function _1_()
  local treesitter = require("nvim-treesitter.configs")
  local defaults = {"vimdoc", "bash", "scheme", "go", "gomod", "gowork", "gosum", "gdscript", "python", "fennel", "terraform", "json", "lua", "markdown", "yaml"}
  return treesitter.setup({highlight = {enable = true, disable = {"markdown"}, additional_vim_regex_highlighting = false}, indent = {enable = true, disable = {"html", "markdown"}}, incremental_selection = {enable = true, keymaps = {init_selection = "<c-space>", node_decremental = "<m-space>", node_incremental = "<c-space>", scope_incremental = "<c-s>"}}, select = {enable = true}, auto_install = true, ensure_installed = defaults})
end
return {{"nvim-treesitter/nvim-treesitter", build = ":TSUpdate", config = _1_}}
