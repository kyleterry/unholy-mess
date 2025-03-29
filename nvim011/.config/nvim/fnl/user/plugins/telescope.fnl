(local {: lazy-keymap} (require :user.utils))

(fn telescope-keys []
  (let [builtin (require :telescope.builtin)]
    [(lazy-keymap :<leader>ff builtin.find_files "find files")
     (lazy-keymap :<leader>fg builtin.live_grep "live grep")
     (lazy-keymap :<leader>fw builtin.grep_string "grep word under cursor")
     (lazy-keymap :<leader>fb builtin.buffers "list buffers")
     (lazy-keymap :<leader>fh builtin.help_tags "find help topics")
     (lazy-keymap :<leader>fn
                  #(builtin.find_files {:cwd (vim.fn.stdpath :config)})
                  "find neovim files")
     (lazy-keymap :<leader>ft vim.cmd.TodoTelescope "find TODO comments")]))

{1 :nvim-telescope/telescope.nvim
 :dependencies [:nvim-telescope/telescope-ui-select.nvim]
 :config (fn []
           (let [telescope (require :telescope)
                 actions (require :telescope.actions)
                 mappings {:i {:<esc> actions.close}}]
             (telescope.setup {:defaults {: mappings
                                          :borderchars ["─"
                                                        "│"
                                                        "─"
                                                        "│"
                                                        "┌"
                                                        "┐"
                                                        "┘"
                                                        "└"]
                                          :layout_strategy :bottom_pane
                                          :layout_config {:bottom_pane {:prompt_position :top
                                                                        :width {:padding 0}
                                                                        :height 50
                                                                        :preview_width 0.5}}
                                          :sorting_strategy :ascending}
                               :pickers {:find_files {:find_command [:rg
                                                                     :--files
                                                                     :--iglob
                                                                     :!.git
                                                                     :--hidden]}}})))
 :keys #(telescope-keys)}
