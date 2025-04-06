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

    hyprpanel.url = "github:Jas-SinghFSU/HyprPanel";

    stylix.url = "github:danth/stylix";

    hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1";

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
          inputs.stylix.nixosModules.stylix
          {
            nixpkgs.overlays = [
              inputs.hyprpanel.overlay

              (final: prev: {
                matugen = final.rustPlatform.buildRustPackage rec {
                  pname = "matugen";
                  version = "2.4.0";

                  src = final.fetchFromGitHub {
                    owner = "InioX";
                    repo = "matugen";
                    rev = "refs/tags/v${version}";
                    hash =
                      "sha256-l623fIVhVCU/ylbBmohAtQNbK0YrWlEny0sC/vBJ+dU=";
                  };

                  cargoHash =
                    "sha256-FwQhhwlldDskDzmIOxhwRuUv8NxXCxd3ZmOwqcuWz64=";

                  meta = {
                    description = "Material you color generation tool";
                    homepage = "https://github.com/InioX/matugen";
                    changelog =
                      "https://github.com/InioX/matugen/blob/${src.rev}/CHANGELOG.md";
                    license = final.lib.licenses.gpl2Only;
                    maintainers = with final.lib.maintainers; [ lampros ];
                    mainProgram = "matugen";
                  };
                };
              })
            ];
          }
          ./core/linux/configuration.nix
          inputs.home-manager.nixosModules.home-manager
          {
            home-manager = {
              backupFileExtension = "backup";
              useGlobalPkgs = true;
              useUserPackages = true;
              users.artemson = {
                imports = [
                  inputs.hyprland.homeManagerModules.default
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
          inputs.stylix.darwinModules.stylix
          ./core/darwin/configuration.nix
          inputs.home-manager.darwinModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              users.artemson = { imports = [ ./home/darwin-home.nix ]; };
              extraSpecialArgs = { inherit inputs; };
            };
          }
        ];
      };
    };
}
