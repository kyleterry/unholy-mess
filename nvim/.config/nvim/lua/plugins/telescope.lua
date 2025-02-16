-- [nfnl] Compiled from fnl/plugins/telescope.fnl by https://github.com/Olical/nfnl, do not edit.
local function _1_()
  local telescope = require("telescope")
  local builtin = require("telescope.builtin")
  local themes = require("telescope.themes")
  local actions = require("telescope.actions")
  local km = vim.keymap.set
  local mappings = {i = {["<esc>"] = actions.close}}
  telescope.setup({defaults = {file_ignore_patterns = {"node_modules"}, vimgrep_arguments = {"rg", "--color=never", "--no-heading", "--with-filename", "--line-number", "--column", "--smart-case", "--iglob", "!.git", "--hidden"}, mappings = mappings}, extensions = {["ui-select"] = {themes.get_dropdown({})}}, pickers = {find_files = {find_command = {"rg", "--files", "--iglob", "!.git", "--hidden"}, theme = "ivy"}, buffers = {mappings = {i = {["<c-d>"] = actions.delete_buffer}}, sort_lastused = true, theme = "ivy", previewer = false}, live_grep = {theme = "ivy"}, grep_string = {theme = "ivy"}, help_tags = {theme = "ivy"}, commands = {theme = "ivy", previewer = false}, git_status = {theme = "ivy"}, lsp_document_symbols = {theme = "ivy"}}})
  km("n", "<leader>ff", builtin.find_files, {noremap = true, desc = "[f]ind [f]iles"})
  local function _2_()
    return builtin.live_grep({search = "", only_sort_text = true, shorten_path = true})
  end
  km("n", "<leader>fg", _2_, {noremap = true, desc = "[f]ind text with [g]rep"})
  km("n", "<leader>fb", builtin.buffers, {noremap = true, desc = "[f]ind open [b]uffers"})
  km("n", "<leader>fh", builtin.help_tags, {noremap = true, desc = "[f]ind [h]elp docs"})
  km("n", "<leader>fS", builtin.git_status, {noremap = true, desc = "[f]uckin show git [S]tatus"})
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
  telescope.load_extension("ui-select")
  return telescope.load_extension("live_grep_args")
end
return {{"nvim-telescope/telescope.nvim", dependencies = {"nvim-telescope/telescope-ui-select.nvim", "nvim-telescope/telescope-live-grep-args.nvim", "nvim-lua/popup.nvim", "nvim-lua/plenary.nvim"}, config = _1_}}
