-- [nfnl] Compiled from fnl/user/plugins/go.fnl by https://github.com/Olical/nfnl, do not edit.
local function _1_()
  return require("go.install").update_all_sync()
end
return {"ray-x/go.nvim", dependencies = {"ray-x/guihua.lua"}, event = "CmdlineEnter", ft = {"go", "gomod"}, opts = {verbose = true}, build = _1_}
