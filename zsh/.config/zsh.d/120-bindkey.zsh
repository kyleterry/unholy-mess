#!/bin/zsh

bindkey -M menuselect '^xi' vi-insert
bindkey -M emacs '\ee' edit-command-line # alt-e
bindkey -M vicmd v edit-command-line

source /usr/share/fzf/key-bindings.zsh
