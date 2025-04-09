(let [lazypath (.. (vim.fn.stdpath :data) :/lazy)
      lazyrepo :lazy.nvim
      install-path (string.format "%s/%s" lazypath lazyrepo)]
  (when (> (vim.fn.empty (vim.fn.glob install-path)) 0)
    (vim.api.nvim_command (string.format "!git clone --filter=blob:none --single-branch https://github.com/folke/%s %s"
                                         lazyrepo install-path)))
  (vim.opt.runtimepath:prepend install-path))

(let [lazy (require :lazy)]
  (lazy.setup :user.plugins))
