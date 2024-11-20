{
  imports = [
    ./home.nix
    ./packages.nix
    ./ssh.nix
    ./kitty.nix
    ./zsh
  ];

  programs = {
    jq.enable = true;
    direnv = {
      enable = true;
      nix-direnv.enable = true;
    };
    fd = {
      enable = true;
      ignores = [
        ".git/"
        ".direnv/"
      ];
    };
    fzf = {
      enable = true;
      enableZshIntegration = true;
      defaultCommand = "fd -f";
    };
  };
}
