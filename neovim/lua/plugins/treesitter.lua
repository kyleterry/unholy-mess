-- [nfnl] Compiled from fnl/plugins/treesitter.fnl by https://github.com/Olical/nfnl, do not edit.
local function _1_()
  local treesitter = require("nvim-treesitter.configs")
  local defaults = {"bash", "scheme", "go", "gomod", "gowork", "gosum", "gdscript", "python", "fennel", "json", "lua", "markdown", "yaml"}
  return treesitter.setup({highlight = {enable = true}, indent = {enable = true}, ensure_installed = defaults})
end
return {{"nvim-treesitter/nvim-treesitter", build = ":TSUpdate", config = _1_}}
