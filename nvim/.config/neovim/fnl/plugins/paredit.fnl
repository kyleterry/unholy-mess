(local {: autoload} (require :nfnl.module))
(local nvim (autoload :nvim))

(local fun (require :config.fun))

(local lisps [:scheme :lisp :fennel :racket :clojure])

; (fn lsp-indent [event opts]
;   (let [traversal (require :nvim-paredit.utils.traversal)
;         utils (require :nvim-paredit.indentation.utils)
;         langs (require :nvim-paredit.lang)
;         lang (langs.get_language_api)
;         parent event.parent
;         child nil]
;     (when (= event.type :slurp-forwards)
;       (set child (parent:named_child (- (parent:named_child_count) 1))))
;     (when (= event.type :slurp-backwards)
;       (set child (parent:named_child 1)))
;     (when (= event.type :barf-forwards)
;       (set child (traversal.get_next_sibling_ignoring_comments event.parent {:lang lang})))
;     (when (= event.type :barf-backwards)
;       (set child parent))
;     ))

[{1 :windwp/nvim-autopairs
  :event :InsertEnter
  :lazy false
  :config (fn []
            (let [autopairs (require :nvim-autopairs)]
              (autopairs.setup {:ignore_next_char ""
                                :enable_check_bracket_line false})
              (tset (fun.head (autopairs.get_rules "'")) :not_filetypes lisps)
              (tset (fun.head (autopairs.get_rules "`")) :not_filetypes lisps)))}

 {1 :julienvincent/nvim-paredit
  :lazy false
  :dependencies [:julienvincent/nvim-paredit-fennel
                 :ekaitz-zarraga/nvim-paredit-scheme]
  :ft lisps
  :config (fn []
            (let [paredit (require :nvim-paredit)
                  paredit-fennel (require :nvim-paredit-fennel)
                  paredit-scheme (require :nvim-paredit-scheme)]
              (paredit.setup
                {:keys
                 {:<A-H> [paredit.api.slurp_backwards "Slurp backwards"]
                  :<A-J> [paredit.api.barf_backwards "Barf backwards"]
                  :<A-K> [paredit.api.barf_forwards "Barf forwards"]
                  :<A-L> [paredit.api.slurp_forwards "Slurp forwards"]

                  :<localleader>w
                  [(fn []
                     (paredit.cursor.place_cursor
                       (paredit.wrap.wrap_element_under_cursor "( " ")")
                       {:placement :inner_start :mode :insert}))
                   "Wrap element insert head"]

                  :<localleader>W
                  [(fn []
                     (paredit.cursor.place_cursor
                       (paredit.wrap.wrap_element_under_cursor "(" ")")
                       {:placement :inner_end :mode :insert}))
                   "Wrap element insert tail"]}
                 :indent {:enabled true}})
              (paredit-fennel.setup {})
              (paredit-scheme.setup paredit)))}

 {1 :kylechui/nvim-surround
  :event "VeryLazy"
  :config (fn []
            (let [surround (require :nvim-surround)]
              (surround.setup)))}]
