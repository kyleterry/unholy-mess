-- [nfnl] Compiled from fnl/user/plugins/mason.fnl by https://github.com/Olical/nfnl, do not edit.
local function _1_()
  return require("mason").setup({})
end
return {"williamboman/mason.nvim", config = _1_, lazy = false}
