{ pkgs, inputs, ... }:

{
  home.packages = [ inputs.nixvim-flake.packages.${pkgs.system}.default ];
}
