[{1 :rcarriga/nvim-notify
  :config (fn []
            (let [notify (require :notify)]
              (notify.setup {:stages :static
                             :render :compact
                             :icons {:DEBUG :D
                                     :ERROR :E
                                     :INFO :I
                                     :TRACE :T
                                     :WARN :W}})
              (set vim.notify notify)))}]
