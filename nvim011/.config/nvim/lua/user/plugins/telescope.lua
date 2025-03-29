-- [nfnl] Compiled from fnl/user/plugins/telescope.fnl by https://github.com/Olical/nfnl, do not edit.
local _local_1_ = require("user.utils")
local lazy_keymap = _local_1_["lazy-keymap"]
local function telescope_keys()
  local builtin = require("telescope.builtin")
  local function _2_()
    return builtin.find_files({cwd = vim.fn.stdpath("config")})
  end
  return {lazy_keymap("<leader>ff", builtin.find_files, "find files"), lazy_keymap("<leader>fg", builtin.live_grep, "live grep"), lazy_keymap("<leader>fw", builtin.grep_string, "grep word under cursor"), lazy_keymap("<leader>fb", builtin.buffers, "list buffers"), lazy_keymap("<leader>fh", builtin.help_tags, "find help topics"), lazy_keymap("<leader>fn", _2_, "find neovim files"), lazy_keymap("<leader>ft", vim.cmd.TodoTelescope, "find TODO comments")}
end
local function _3_()
  local telescope = require("telescope")
  local actions = require("telescope.actions")
  local mappings = {i = {["<esc>"] = actions.close}}
  return telescope.setup({defaults = {mappings = mappings, borderchars = {"\226\148\128", "\226\148\130", "\226\148\128", "\226\148\130", "\226\148\140", "\226\148\144", "\226\148\152", "\226\148\148"}, layout_strategy = "bottom_pane", layout_config = {bottom_pane = {prompt_position = "top", width = {padding = 0}, height = 50, preview_width = 0.5}}, sorting_strategy = "ascending"}, pickers = {find_files = {find_command = {"rg", "--files", "--iglob", "!.git", "--hidden"}}}})
end
local function _4_()
  return telescope_keys()
end
return {"nvim-telescope/telescope.nvim", dependencies = {"nvim-telescope/telescope-ui-select.nvim"}, config = _3_, keys = _4_}
