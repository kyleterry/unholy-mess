(local core (require :nfnl.core))

(fn with-theme [name tbl]
  (let [theme-tbl {:theme name}]
    (core.merge! theme-tbl tbl)))

[{1 :nvim-telescope/telescope.nvim
  :dependencies [:nvim-telescope/telescope-ui-select.nvim
                 :nvim-telescope/telescope-live-grep-args.nvim
                 :nvim-lua/popup.nvim
                 :nvim-lua/plenary.nvim]
  :config (fn []
            (let [telescope (require :telescope)
                  builtin (require :telescope.builtin)
                  themes (require :telescope.themes)
                  theme :ivy
                  actions (require :telescope.actions)
                  km vim.keymap.set
                  mappings {:i {:<esc> actions.close}}]
              (telescope.setup {:defaults {:file_ignore_patterns [:node_modules]
                                           :vimgrep_arguments [:rg
                                                               :--color=never
                                                               :--no-heading
                                                               :--with-filename
                                                               :--line-number
                                                               :--column
                                                               :--smart-case
                                                               :--iglob
                                                               :!.git
                                                               :--hidden]
                                           : mappings}
                                :extensions {:ui-select {1 (themes.get_dropdown {})}}
                                :pickers {:find_files {:find_command [:rg
                                                                      :--files
                                                                      :--iglob
                                                                      :!.git
                                                                      :--hidden]
                                                       :theme :ivy}
                                          :buffers {:mappings {:i {:<c-d> actions.delete_buffer}}
                                                    :previewer false
                                                    :sort_lastused true
                                                    :theme :ivy}
                                          ; :live_grep {:theme :ivy}
                                          :live_grep (with-theme theme nil)
                                          :grep_string {:theme :ivy}
                                          :help_tags {:theme :ivy}
                                          ; :commands {:theme :ivy
                                          ;            :previewer false}
                                          :commands (with-theme theme
                                                      {:previewer false})
                                          :git_status {:theme :ivy}
                                          :lsp_document_symbols {:theme :ivy}}})
              (km :n :<leader>ff builtin.find_files
                  {:noremap true :desc "[f]ind [f]iles"})
              (km :n :<leader>fg
                  (fn []
                    (builtin.live_grep {:search ""
                                        :only_sort_text true
                                        :shorten_path true}))
                  {:noremap true :desc "[f]ind text with [g]rep"})
              (km :n :<leader>fb builtin.buffers
                  {:noremap true :desc "[f]ind open [b]uffers"})
              (km :n :<leader>fh builtin.help_tags
                  {:noremap true :desc "[f]ind [h]elp docs"})
              (km :n :<leader>fS builtin.git_status
                  {:noremap true :desc "[f]uckin show git [S]tatus"})
              (km :n :<leader>fn
                  (fn []
                    (builtin.find_files {:cwd (vim.fn.stdpath :config)}))
                  {:noremap true :desc "[f]ind [n]eovim files"})
              (km :n :<leader>ft vim.cmd.TodoTelescope
                  {:noremap true :desc "[f]ind [t]odo comments"})
              (km :n :<leader>fs
                  (fn []
                    (builtin.grep_string {:search (vim.fn.input "grep > ")}))
                  {:noremap true :desc "[f]ind text with [s]tring"})
              (km :n :<leader>fc builtin.commands
                  {:noremap true :desc "[f]ind [c]ommands"})
              (telescope.load_extension :ui-select)
              (telescope.load_extension :live_grep_args)))}]
