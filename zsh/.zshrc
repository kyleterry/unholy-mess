#!/bin/zsh

bindkey -e

fpath=("${HOME}/.config/zsh-prompts" "$fpath[@]")

autoload -U compinit promptinit
compinit
promptinit; prompt gentoo

setopt correctall

autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
RPROMPT=\$vcs_info_msg_0_
zstyle ':vcs_info:git:*' formats '%s:%b'

autoload -Uz run-help

. "${HOME}/.nix-profile/etc/profile.d/hm-session-vars.sh"

eval $(fzf --zsh)

export MANWIDTH=120

alias vim='nvim'

PS1='%F{blue}%~ %(?.%F{green}.%F{red})%#%f '

zsh_d="$(fd --glob '*.zsh' ${HOME}/.config/zsh.d)"
zsh_scripts=($(echo ${zsh_d} | tr '\n' ' '))

for config in ${zsh_scripts}; do
  source ${config}
done

export XDG_CURRENT_DESKTOP=sway
[ "$(tty)" = "/dev/tty1" ] && exec dbus-run-session sway
