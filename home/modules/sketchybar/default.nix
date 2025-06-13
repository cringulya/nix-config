{ pkgs, ... }:

{
  home.packages = with pkgs; [
    sketchybar
  ];

  home.file.".config/sketchybar" = {
    source = ./.;
    recursive = true;
  };
}
