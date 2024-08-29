{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

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
  };

  outputs = inputs@{ self, nixpkgs, nix-darwin, lanzaboote, home-manager, ... }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      username = "artemson";
      inherit (self) outputs;
    in
    {
      nixosConfigurations.abobus = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs outputs username; };
        modules = [
          ./core/linux/configuration.nix
        ];
      };

      # Build darwin flake using:
      # $ darwin-rebuild build --flake .#Artems-MacBook-Air
      darwinConfigurations."Artems-MacBook-Air" = nix-darwin.lib.darwinSystem {
        specialArgs = { inherit inputs outputs; };
        modules = [ ./core/macos/configuration.nix ];
      };

      # Expose the package set, including overlays, for convenience.
      darwinPackages = self.darwinConfigurations."Artems-MacBook-Air".pkgs;

      homeConfigurations = {
        "artemson@abobus" = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          extraSpecialArgs = { inherit inputs outputs; };
          modules = [
            ./home/home.nix
          ];
        };
      };
    };
}
