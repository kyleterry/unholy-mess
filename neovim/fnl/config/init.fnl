(local {: autoload} (require :nfnl.module))
(local nvim (autoload :nvim))
(local core (autoload :nfnl.core))

;space is reserved to be lead
(nvim.set_keymap :n :<space> :<nop> {:noremap true})

;sets a nvim global options
(let [options
      {:backup false
       :writebackup false
       :swapfile false
       :title true
       :expandtab true
       :tabstop 2
       :shiftwidth 2
       :softtabstop 2
       :shiftround true
       :autoindent true
       :completeopt "menu,menuone,noselect"
       :ignorecase true
       :smartcase true
       :smarttab true
       :hlsearch true
       :incsearch true
       :showmatch true
       :matchpairs "(:),{:},[:],<:>"
       :clipboard "unnamedplus"
       :number true
       :numberwidth 3
       :relativenumber true
       :signcolumn :yes
       :linebreak true
       :wrap false
       :cursorline true
       :cursorcolumn true
       :scrolloff 3
       :mouse ""}]
  (each [option value (pairs options)]
    (core.assoc nvim.o option value)))
