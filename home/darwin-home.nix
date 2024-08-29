{ pkgs, ... }:

{
  imports = [
    ./common.nix
    ./sketchybar
    ./packages/darwin.nix
  ];

  home.username = "artemson";
  home.homeDirectory = "/Users/artemson";

  programs.zsh.shellAliases = {
    rebuild = "darwin-rebuild switch --flake ~/nix";
  };
}
