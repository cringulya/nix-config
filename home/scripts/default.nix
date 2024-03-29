{ config, pkgs, ... }:

let
  get-layout = import ./get-layout.nix { inherit pkgs; };
  wall-picker = import ./wall-picker.nix { inherit pkgs; };
  set-wallpaper = import ./set-wallpaper.nix { inherit pkgs; };
in
{
  home.packages = [
    get-layout
    wall-picker
    set-wallpaper
  ];
}
