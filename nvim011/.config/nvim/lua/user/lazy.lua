-- [nfnl] Compiled from fnl/user/lazy.fnl by https://github.com/Olical/nfnl, do not edit.
do
  local lazypath = (vim.fn.stdpath("data") .. "/lazy")
  local lazyrepo = "lazy.nvim"
  local install_path = string.format("%s/%s", lazypath, lazyrepo)
  if (vim.fn.empty(vim.fn.glob(install_path)) > 0) then
    vim.api.nvim_command(string.format("!git clone --filter=blob:none --single-branch https://github.com/folke/%s %s", lazyrepo, install_path))
  else
  end
  vim.opt.runtimepath:prepend(install_path)
end
local lazy = require("lazy")
return lazy.setup("user.plugins")
