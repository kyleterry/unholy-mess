#!/bin/zsh

eval "$(dircolors -b /etc/DIR_COLORS)"
alias ls="ls --color=auto"

eval "$(direnv hook zsh)"

setopt PROMPT_SUBST

show_virtual_env() {
  if [[ -n "$VIRTUAL_ENV" && -n "$DIRENV_DIR" ]]; then
    echo "($(basename $VIRTUAL_ENV))"
  fi
}

PS1='$(show_virtual_env)'$PS1

source <(fzf --zsh)
