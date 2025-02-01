{
  description = "Blackhole of madness";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ self, nixpkgs, home-manager }:
    let
      configuration = { pkgs, ... }: {
        environment.systemPackages =
          [ pkgs.ripgrep ];

        nixpkgs.hostPlatform = "x86_64-linux";
        services.nix-daemon.enable = true;
        nix.settings.experimental-features = "nix-command flakes";
        programs.zsh.enable = true;
        system.configurationRevision = self.rev or self.dirtyRev or null;
        system.stateVersion = 5;

        users.users."kyle" = {
          home = "/home/kyle";
          shell = pkgs.zsh;
        };
      };
    in {
      };
}
