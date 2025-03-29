#!/bin/zsh

export HISTSIZE=10000
export SAVEHIST=$HISTSIZE
export HISTFILE="$HOME/.history"
setopt hist_ignore_all_dups
