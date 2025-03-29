-- [nfnl] Compiled from fnl/user/plugins/notify.fnl by https://github.com/Olical/nfnl, do not edit.
local _local_1_ = require("user.utils")
local lazy_keymap = _local_1_["lazy-keymap"]
local function notify_keys()
  local dismiss
  local function _2_()
    return require("notify").dismiss
  end
  dismiss = _2_
  local function _3_()
    return dismiss({silent = false})
  end
  return {lazy_keymap("<leader>nd", _3_, "dismiss notification"), lazy_keymap("<leader>sn", "<cmd>Telescope notify<cr>", "search notifications with telescope")}
end
local function _4_(_, opts)
  local notify = require("notify")
  notify.setup(opts)
  vim.notify = notify
  return nil
end
return {"rcarriga/nvim-notify", opts = {stages = "static", render = "compact", icons = {DEBUG = "D", ERROR = "E", INFO = "I", TRACE = "T", WARN = "W"}}, event = "VeryLazy", config = _4_, keys = notify_keys()}
