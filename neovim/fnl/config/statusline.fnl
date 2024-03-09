(fn statusline []
  (table.concat ["%#PmenuSel#"
   "%{FugitiveStatusline()}"
   "%#StatusLine#"
   " %f"
   "%="
   "%y"
   " %{&fileencoding?&fileencoding:&encoding}"
   "%r"
   " %p%%"
   " %l,%c"
   ]))

(fn setup []
  (set vim.opt.statusline "%!v:lua.require'config.statusline'.statusline()"))

{: statusline
 : setup}
