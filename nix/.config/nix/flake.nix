{
  description = "Blackhole of madness";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    darwin.url = "github:LnL7/nix-darwin";
    darwin.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    nix-homebrew.url = "github:zhaofengli-wip/nix-homebrew";

    homebrew-core = {
      url = "github:homebrew/homebrew-core";
      flake = false;
    };

    homebrew-cask = {
      url = "github:homebrew/homebrew-cask";
      flake = false;
    };
  };

  outputs = inputs@{ self, nixpkgs, home-manager, darwin, nix-homebrew, homebrew-core, homebrew-cask }:
    let
      configuration = { pkgs, ... }: {
        environment.systemPackages =
          [ pkgs.ripgrep ];

        nixpkgs.hostPlatform = "aarch64-darwin";

        security.pam.enableSudoTouchIdAuth = true;

        services.nix-daemon.enable = true;

        nix.settings.experimental-features = "nix-command flakes";

        programs.zsh.enable = true;
        system.configurationRevision = self.rev or self.dirtyRev or null;
        system.stateVersion = 5;

        users.users."kyle.terry" = {
          home = "/Users/kyle.terry";
          shell = pkgs.zsh;
        };
      };
    in {
      darwinConfigurations."AMER-Kyle-Terry" = darwin.lib.darwinSystem {
        system = "aarch64-darwin";
        modules = [
          configuration
          nix-homebrew.darwinModules.nix-homebrew {
            nix-homebrew = {
              enable = true;
              enableRosetta = true;
              user = "kyle.terry";
              autoMigrate = true;
            };
          }
          ./darwin
          home-manager.darwinModules.home-manager {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users."kyle.terry" = import ./home;
          }
        ];
      };
    };
}
