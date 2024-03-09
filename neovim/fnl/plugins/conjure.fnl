(local {: autoload} (require :nfnl.module))
(local nvim (autoload :nvim))

[{1 :Olical/conjure
  :branch "master"
  :init (fn []
          (set nvim.g.conjure#log#hud#enabled false)
          (set nvim.g.conjure#mapping#doc_word "K")
          (set nvim.g.conjure#filetype#fennel "conjure.client.fennel.stdio")
          (set nvim.g.conjure#client#scheme#stdio#command "gerbil interactive")
          (set nvim.g.conjure#client#scheme#stdio#prompt_pattern "> $?")
          (set nvim.g.conjure#client#racket#stdio#command "racket")
          (set nvim.g.conjure#client#clojure#nrepl#eval#auto_require false)
          (set nvim.g.conjure#client#clojure#nrepl#connection#auto_repl#enabled false))}]
