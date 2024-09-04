{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    lanzaboote = {
      url = "github:nix-community/lanzaboote/v0.3.0";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-darwin = {
      url = "github:LnL7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zen-browser.url = "github:MarceColl/zen-browser-flake";

    catppuccin.url = "github:catppuccin/nix";

    hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1";

    nixvim-flake = {
      url = "github:cringulya/nixvim-config";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ self, nixpkgs, nix-darwin, lanzaboote, home-manager, ... }:
    let
      username = "artemson";
      inherit (self) outputs;
    in {
      nixosConfigurations.abobus = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs outputs username; };
        modules = [
          ./core/linux/configuration.nix
          inputs.home-manager.nixosModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              users.artemson = {
                imports = [
                  inputs.catppuccin.homeManagerModules.catppuccin
                  ./home/linux-home.nix
                ];
              };
              extraSpecialArgs = { inherit inputs outputs username; };

            };
          }
        ];
      };

      darwinConfigurations."abobus-mb" = nix-darwin.lib.darwinSystem {
        specialArgs = {
          inherit inputs outputs;
          system = "aarch64-darwin";
        };
        modules = [
          ./core/darwin/configuration.nix
          home-manager.darwinModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              users.artemson = import ./home/darwin-home.nix;
              extraSpecialArgs = { inherit inputs; };
            };
          }
        ];
      };
    };
}
