#!/bin/zsh

bindkey -e

fpath=("${HOME}/.config/zsh-prompts" "$fpath[@]")

autoload -U compinit promptinit

compinit
promptinit

setopt correctall

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

export FZF_DEFAULT_COMMAND='fd --type f --strip-cwd-prefix'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

export MANWIDTH=120

alias vim='nvim'

# PS1='%F{blue}%~ %(?.%F{green}.%F{red})%#%f '

zsh_d="$(fd --glob '*.zsh' ${HOME}/.config/zsh.d)"
zsh_scripts=($(echo ${zsh_d} | tr '\n' ' '))

for config in ${zsh_scripts}; do
  source ${config}
done

prompt kyle

export XDG_CURRENT_DESKTOP=sway

# [[ "$(tty)" == "/dev/tty1" ]] && exec dbus-run-session sway
if [ -z "$WAYLAND_DISPLAY" ] && [ -n "$XDG_VTNR" ] && [ "$XDG_VTNR" -eq 1 ] ; then
  exec dbus-run-session sway
fi
