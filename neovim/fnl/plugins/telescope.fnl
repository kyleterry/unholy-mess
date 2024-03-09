(local {: autoload} (require :nfnl.module))
(local nvim (autoload :nvim))

[{1 :nvim-telescope/telescope.nvim
  :dependencies [:nvim-telescope/telescope-ui-select.nvim
                 :nvim-lua/popup.nvim
                 :nvim-lua/plenary.nvim]
  :init (fn []
          (nvim.set_keymap :n :<leader>ff ":lua require('telescope.builtin').find_files()<CR>" {:noremap true :desc "[f]ind [f]iles"})
          (nvim.set_keymap :n :<leader>fg ":lua require('telescope.builtin').live_grep()<CR>" {:noremap true :desc "[f]ind text with [g]rep"})
          (nvim.set_keymap :n :<leader>fb ":lua require('telescope.builtin').buffers()<CR>" {:noremap true :desc "[f]ind open [b]uffers"})
          (nvim.set_keymap :n :<leader>fh ":lua require('telescope.builtin').help_tags()<CR>" {:noremap true :desc "[f]ind [h]elp docs"})
          (nvim.set_keymap :n :<leader>fn ":lua require('telescope.builtin').find_files({cwd = vim.fn.stdpath 'config'})<CR>" {:noremap true :desc "[f]ind [n]eovim files"})
          (nvim.set_keymap :n :<leader>ft ":TodoTelescope<CR>" {:noremap true :desc "[f]ind [t]odo comments"}))
  :config (fn []
            (let [telescope (require :telescope)
                  themes (require :telescope.themes)
                  actions (require :telescope.actions)
                  mappings {:i {:<esc> actions.close}}]
              (telescope.setup {:defaults {:file_ignore_patterns ["node_modules"]
                                           :vimgrep_arguments ["rg"
                                                               "--color=never"
                                                               "--no-heading"
                                                               "--with-filename"
                                                               "--line-number"
                                                               "--column"
                                                               "--smart-case"
                                                               "--iglob"
                                                               "!.git"
                                                               "--hidden"]
                                           :mappings mappings}
                                :extensions {:ui-select {1 (themes.get_dropdown {})}}
                                :pickers {:find_files {:find_command ["rg"
                                                                      "--files"
                                                                      "--iglob"
                                                                      "!.git"
                                                                      "--hidden"]}}})
              (telescope.load_extension "ui-select")))}]
