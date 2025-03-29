(local {: lazy-keymap} (require :user.utils))

(fn notify-keys []
  (let [dismiss #(. (require :notify) :dismiss)]
    [(lazy-keymap :<leader>nd #(dismiss {:silent false}) "dismiss notification")
     (lazy-keymap :<leader>sn "<cmd>Telescope notify<cr>"
                  "search notifications with telescope")]))

{1 :rcarriga/nvim-notify
 :opts {:stages :static
        :render :compact
        :icons {:DEBUG :D :ERROR :E :INFO :I :TRACE :T :WARN :W}}
 :event :VeryLazy
 :config (fn [_ opts]
           (let [notify (require :notify)]
             (notify.setup opts)
             (set vim.notify notify)))
 :keys (notify-keys)}
