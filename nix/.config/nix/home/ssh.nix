{ config, lib, pkgs, ... }: with lib; {
  programs.ssh = {
    enable = true;
    package = pkgs.openssh;
    forwardAgent = true;
    compression = true;
    # controlMaster = "auto";
    # controlPath = "~/.ssh/S.%r@%h:%p";
    # controlPersist = "10m";
  };
}
