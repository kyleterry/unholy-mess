(local mod {})

(fn mod.statusline []
  (table.concat ["%#PmenuSel#"
                 "%{FugitiveStatusline()}"
                 "%#StatusLine#"
                 " %f"
                 "%="
                 "%y"
                 " %{&fileencoding?&fileencoding:&encoding}"
                 "%r"
                 " %p%%"
                 " %l,%c"]))

(fn mod.setup []
  (set vim.opt.statusline "%!v:lua.require'config.statusline'.statusline()"))

mod
