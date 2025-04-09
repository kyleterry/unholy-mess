{1 :nvim-lualine/lualine.nvim
 :lazy false
 :dependencies [:nvim-tree/nvim-web-devicons]
 :config (fn []
           (let [lualine (require :lualine)
                 theme (require :lualine.themes.gruvbox_dark)]
             (lualine.setup {:options {:icons_enabled false
                                       : theme
                                       :section_separators ""
                                       :component_separators ""}})))}
