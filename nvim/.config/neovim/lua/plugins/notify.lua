-- [nfnl] Compiled from fnl/plugins/notify.fnl by https://github.com/Olical/nfnl, do not edit.
local function _1_()
  local notify = require("notify")
  notify.setup({stages = "static", render = "compact", icons = {DEBUG = "D", ERROR = "E", INFO = "I", TRACE = "T", WARN = "W"}})
  vim.notify = notify
  return nil
end
return {{"rcarriga/nvim-notify", config = _1_}}
