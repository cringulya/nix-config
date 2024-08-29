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
  };

  outputs = inputs@{ self, nixpkgs, nix-darwin, lanzaboote, home-manager, ... }:
    let
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
      # $ darwin-rebuild build --flake .
      darwinConfigurations."abobus-mb" = nix-darwin.lib.darwinSystem {
        specialArgs = { inherit inputs outputs; };
        modules = [
          ./core/darwin/configuration.nix
          home-manager.darwinModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.artemson = import ./home/darwin-home.nix;

            # Optionally, use home-manager.extraSpecialArgs to pass
            # arguments to home.nix
          }
        ];
      };

      # Expose the package set, including overlays, for convenience.
      # darwinPackages = self.darwinConfigurations."abobus-mb".pkgs;

      # homeConfigurations = {
      #   "artemson@abobus" = home-manager.lib.homeManagerConfiguration {
      #     inherit pkgs;
      #     extraSpecialArgs = { inherit inputs outputs; };
      #     modules = [
      #       ./home/linux-home.nix
      #     ];
      #   };
      # };
    };
}
