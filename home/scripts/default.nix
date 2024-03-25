{ config, pkgs, ... }:

let
  get-layout = import ./get-layout.nix { inherit pkgs; };
in
{
  home.packages = [
    get-layout
  ];
}
