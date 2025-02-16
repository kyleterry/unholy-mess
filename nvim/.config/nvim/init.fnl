(tset vim.g :mapleader ",")
(tset vim.g :maplocalleader " ")

(local lazypath (.. (vim.fn.stdpath :data) :/lazy))

(fn ensure [user repo]
  (let [install-path (string.format "%s/%s" lazypath repo)]
    (when (> (vim.fn.empty (vim.fn.glob install-path)) 0)
      (vim.api.nvim_command (string.format "!git clone --filter=blob:none --single-branch https://github.com/%s/%s %s"
                                           user repo install-path)))
    (vim.opt.runtimepath:prepend install-path)))

(ensure :folke :lazy.nvim)
(ensure :Olical :nfnl)

(let [lazy (require :lazy)]
  (lazy.setup {:spec {:import :plugins} :checker {:enabled true}}))

(require :config.init)
(require :config.mappings)
(require :config.filetypes)
(require :config.autocmds)
(require :config.diagnostics)

(let [statusline (require :config.statusline)]
  (statusline.setup))
