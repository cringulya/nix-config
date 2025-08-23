{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    lanzaboote = {
      # TODO: Return the version back
      url = "github:nix-community/lanzaboote";
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

    stylix.url = "github:danth/stylix";

    hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1";
  };

  outputs =
    inputs@{ self
    , nixpkgs
    , nix-darwin
    , lanzaboote
    , home-manager
    , ...
    }:
    let
      username = "artemson";
      inherit (self) outputs;
    in
    {
      nixosConfigurations.abobus = nixpkgs.lib.nixosSystem {
        specialArgs = {
          inherit inputs outputs username;
          system = "x86_64-linux";
        };
        modules = [
          ./core/nixos
          inputs.stylix.nixosModules.stylix
          inputs.home-manager.nixosModules.home-manager
          {
            home-manager = {
              backupFileExtension = "backup";
              useGlobalPkgs = true;
              useUserPackages = true;
              users.artemson = ./home/users/nixos;
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
          inputs.stylix.darwinModules.stylix
          ./core/darwin
          inputs.home-manager.darwinModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              users.artemson = ./home/users/macbook;
              extraSpecialArgs = { inherit inputs; };
            };
          }
        ];
      };
    };
}
