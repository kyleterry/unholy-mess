(local {: autoload} (require :nfnl.module))
(local core (autoload :nfnl.core))

(let [options {:backup false
               :writebackup false
               :swapfile false
               :title true
               :expandtab true
               :tabstop 2
               :shiftwidth 2
               :softtabstop 2
               :autoindent true
               :ignorecase true
               :number true
               :numberwidth 3
               :relativenumber true
               :signcolumn :yes
               :completeopt "menuone,popup,fuzzy"
               :wrap false
               :cursorline true
               :cursorcolumn true
               :scrolloff 3
               :mouse ""}]
  (each [option value (pairs options)]
    (core.assoc vim.o option value)))
