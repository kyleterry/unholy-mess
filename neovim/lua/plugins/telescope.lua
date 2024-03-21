-- [nfnl] Compiled from fnl/plugins/telescope.fnl by https://github.com/Olical/nfnl, do not edit.
local _local_1_ = require("nfnl.module")
local autoload = _local_1_["autoload"]
local nvim = autoload("nvim")
local function _2_()
  local telescope = require("telescope")
  local builtin = require("telescope.builtin")
  local themes = require("telescope.themes")
  local actions = require("telescope.actions")
  local km = vim.keymap.set
  local mappings = {i = {["<esc>"] = actions.close}}
  telescope.setup({defaults = {file_ignore_patterns = {"node_modules"}, vimgrep_arguments = {"rg", "--color=never", "--no-heading", "--with-filename", "--line-number", "--column", "--smart-case", "--iglob", "!.git", "--hidden"}, mappings = mappings}, extensions = {["ui-select"] = {themes.get_dropdown({})}}, pickers = {find_files = {find_command = {"rg", "--files", "--iglob", "!.git", "--hidden"}, theme = "ivy"}, buffers = {mappings = {i = {["<c-d>"] = actions.delete_buffer}}, sort_lastused = true, theme = "ivy", previewer = false}, live_grep = {theme = "ivy"}, grep_string = {theme = "ivy"}, help_tags = {theme = "ivy"}, commands = {theme = "ivy", previewer = false}, lsp_document_symbols = {theme = "ivy"}}})
  km("n", "<leader>ff", builtin.find_files, {noremap = true, desc = "[f]ind [f]iles"})
  km("n", "<leader>fg", builtin.live_grep, {noremap = true, desc = "[f]ind text with [g]rep"})
  km("n", "<leader>fb", builtin.buffers, {noremap = true, desc = "[f]ind open [b]uffers"})
  km("n", "<leader>fh", builtin.help_tags, {noremap = true, desc = "[f]ind [h]elp docs"})
  local function _3_()
    return builtin.find_files({cwd = vim.fn.stdpath("config")})
  end
  km("n", "<leader>fn", _3_, {noremap = true, desc = "[f]ind [n]eovim files"})
  km("n", "<leader>ft", vim.cmd.TodoTelescope, {noremap = true, desc = "[f]ind [t]odo comments"})
  local function _4_()
    return builtin.grep_string({search = vim.fn.input("grep > ")})
  end
  km("n", "<leader>fs", _4_, {noremap = true, desc = "[f]ind text with [s]tring"})
  km("n", "<leader>fc", builtin.commands, {noremap = true, desc = "[f]ind [c]ommands"})
  return telescope.load_extension("ui-select")
end
return {{"nvim-telescope/telescope.nvim", dependencies = {"nvim-telescope/telescope-ui-select.nvim", "nvim-lua/popup.nvim", "nvim-lua/plenary.nvim"}, config = _2_}}
