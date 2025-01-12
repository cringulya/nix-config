{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    lanzaboote = {
      url = "github:nix-community/lanzaboote/v0.4.1";
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

    hyprpanel.url = "github:Jas-SinghFSU/HyprPanel";

    stylix.url = "github:danth/stylix";

    hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1";

    nixvim-flake = {
      url = "github:cringulya/nixvim-config";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    ghostty = {
      url = "github:ghostty-org/ghostty";
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

              (final: prev: {
                python312 = prev.python312.override {
                  packageOverrides = final: prevPy: {

                    triton-bin = prevPy.triton-bin.overridePythonAttrs
                      (oldAttrs: {
                        postFixup = ''
                          chmod +x "$out/${prev.python312.sitePackages}/triton/backends/nvidia/bin/ptxas"
                          substituteInPlace $out/${prev.python312.sitePackages}/triton/backends/nvidia/driver.py \
                            --replace \
                              'return [libdevice_dir, *libcuda_dirs()]' \
                              'return [libdevice_dir, "${prev.addDriverRunpath.driverLink}/lib", "${prev.cudaPackages.cuda_cudart}/lib/stubs/"]'
                        '';
                      });
                  };
                };
                python312Packages = final.python312.pkgs;
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
          home-manager.darwinModules.home-manager
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
