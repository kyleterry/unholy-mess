export XDG_CACHE_HOME="${HOME}/.cache"

export FZF_DEFAULT_COMMAND='fd --type f --strip-cwd-prefix'
export FZF_CTRL_T_COMMAND="${FZF_DEFAULT_COMMAND}"

FZF_COLORS="bg+:gray,\
fg:white,\
fg+:white,\
border:green,\
spinner:0,\
hl:yellow,\
header:blue,\
info:green,\
pointer:red,\
marker:blue,\
prompt:white,\
hl+:red"

export FZF_DEFAULT_OPTS="--height 60% \
--border sharp \
--layout reverse \
--color '$FZF_COLORS' \
--prompt '% ' \
--pointer '>' \
--marker ⇒"

export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -n 10'"
export FZF_COMPLETION_DIR_COMMANDS="cd pushd rmdir tree ls"

export EDITOR="nvim"
export VISUAL="nvim"

export MANWIDTH=120
export MANPAGER="nvim +Man!"

export LOCALBIN="${HOME}/.local/bin"
export CARGOBIN="${HOME}/.cargo/bin"
export GOBIN="${HOME}/go/bin"

export PATH="${GOBIN}:${PATH}"
export PATH="${CARGOBIN}:${PATH}"
export PATH="${LOCALBIN}:${PATH}"
