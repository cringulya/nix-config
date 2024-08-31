{ pkgs, inputs, system, ... }:

{
  home.packages = [
    # inputs.nixvim-flake.packages.${system}.default
  ];
}
