{ config, pkgs, ... }:
{
  home.packages = [ pkgs.ripgrep ];
  home.stateVersion = "24.05";

  programs.home-manager.enable = true;

  nixpkgs.config.allowUnfree = true;
}
