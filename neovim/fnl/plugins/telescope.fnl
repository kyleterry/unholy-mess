(local {: autoload} (require :nfnl.module))
(local nvim (autoload :nvim))

[{1 :nvim-telescope/telescope.nvim
  :dependencies [:nvim-telescope/telescope-ui-select.nvim
                 :nvim-lua/popup.nvim
                 :nvim-lua/plenary.nvim]
  :config (fn []
            (let [telescope (require :telescope)
                  builtin (require :telescope.builtin)
                  themes (require :telescope.themes)
                  actions (require :telescope.actions)
                  km vim.keymap.set
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
              (km :n :<leader>ff builtin.find_files {:noremap true :desc "[f]ind [f]iles"})
              (km :n :<leader>fg builtin.live_grep {:noremap true :desc "[f]ind text with [g]rep"})
              (km :n :<leader>fb builtin.buffers {:noremap true :desc "[f]ind open [b]uffers"})
              (km :n :<leader>fh builtin.help_tags {:noremap true :desc "[f]ind [h]elp docs"})
              (km :n :<leader>fn (fn []
                                   (builtin.find_files {:cwd (vim.fn.stdpath :config)}))
                                 {:noremap true :desc "[f]ind [n]eovim files"})
              (km :n :<leader>ft vim.cmd.TodoTelescope {:noremap true :desc "[f]ind [t]odo comments"})
              (km :n :<leader>fs (fn []
                                   (builtin.grep_string {:search (vim.fn.input "grep > ")}))
                                 {:noremap true :desc "[f]ind text with [s]tring"})
              (telescope.load_extension "ui-select")))}]
