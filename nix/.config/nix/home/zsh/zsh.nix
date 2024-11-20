{ config, lib, pkgs, ... }:
  let inherit lib;
    shellAliases = {
      switch = "darwin-rebuild switch --flake ~/.config/nix";
    };
  in {
    programs.zsh = {
      inherit shellAliases;
      enable = true;
      enableCompletion = true;
      syntaxHighlighting.enable = true;

      initExtra = ''
        eval $(brew shellenv)
        autoload -Uz vcs_info
        precmd_vcs_info() { vcs_info }
        precmd_functions+=( precmd_vcs_info )
        setopt prompt_subst
        RPROMPT=\$vcs_info_msg_0_
        zstyle ':vcs_info:git:*' formats '%b'

        PS1='%F{blue}%~ %(?.%F{green}.%F{red})%#%f '

        autoload -Uz run-help

        export EDITOR=nvim
        export MANWIDTH=120

        ${builtins.readFile ./encrypt.zsh}
      '';
    };
  }
