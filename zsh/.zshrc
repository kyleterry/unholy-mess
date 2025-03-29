#!/bin/zsh

bindkey -e

fpath=("${HOME}/.config/zsh-prompts" "$fpath[@]")
fpath=("${HOME}/.config/zsh-plugins" "$fpath[@]")

zmodload zsh/complist
autoload -U compinit promptinit

compinit
promptinit

setopt correctall

autoload -Uz edit-command-line
zle -N edit-command-line

autoload -Uz vcs_info
precmd() {
  vcs_info
}
setopt prompt_subst
RPROMPT=\$vcs_info_msg_0_
zstyle ':vcs_info:git:*' formats '%s:%b'

autoload -Uz run-help

local home_manager_vars="${HOME}/.nix-profile/etc/profile.d/hm-session-vars.sh"
[[ -f ${home_manager_vars} ]] && source ${home_manager_vars}

source <(fzf --zsh)

alias vim='nvim'

zsh_d="$(fd --glob '*.zsh' ${HOME}/.config/zsh.d)"
zsh_scripts=($(echo ${zsh_d} | tr '\n' ' '))

for config in ${zsh_scripts}; do
  source ${config}
done

prompt kyle

setopt AUTO_PUSHD
setopt PUSHD_IGNORE_DUPS
setopt PUSHD_SILENT

alias d='dirs -v'
for index ({1..9}) alias "$index"="cd +${index}"; unset index

export XDG_CURRENT_DESKTOP=sway

if [ -z "$WAYLAND_DISPLAY" ] && [ -n "$XDG_VTNR" ] && [ "$XDG_VTNR" -eq 1 ] ; then
  exec dbus-run-session sway
fi
autoload -U +X compinit
compinit
autoload -U +X bashcompinit
bashcompinit
