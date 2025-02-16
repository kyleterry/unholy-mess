[{1 :ellisonleao/gruvbox.nvim
  :priority 1000
  :config (fn []
            (let [gruvbox (require :gruvbox)
                  gruvbox-colors (. gruvbox :palette)
                  gruvbox-bg-soft (. gruvbox-colors :dark0_soft)
                  gruvbox-fg-soft (. gruvbox-colors :light1)
                  gruvbox-config {:terminal_colors true
                                  :contrast :hard
                                  :invert_signs false
                                  :transparent_mode false
                                  :italic {:strings false
                                           :emphasis false
                                           :comments false
                                           :operators false
                                           :folds false}
                                  :overrides {:CursorLine {:bg gruvbox-bg-soft}
                                              :StatusLine {:fg gruvbox-fg-soft
                                                           :bg gruvbox-bg-soft}
                                              :SignColumn {:link :Normal}
                                              :GruvboxGreenSign {:bg ""}
                                              :GruvboxOrangeSign {:bg ""}
                                              :GruvboxPurpleSign {:bg ""}
                                              :GruvboxYellowSign {:bg ""}
                                              :GruvboxRedSign {:bg ""}
                                              :GruvboxBlueSign {:bg ""}
                                              :GruvboxAquaSign {:bg ""}}}]
              (gruvbox.setup gruvbox-config)
              (vim.cmd "set background=dark")
              (vim.cmd "colorscheme gruvbox")))}]
