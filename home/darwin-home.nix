{ pkgs, ... }:

{
  imports = [ ./common.nix ./sketchybar ./packages/darwin.nix ];

  home.username = "artemson";
  home.homeDirectory = "/Users/artemson";

  programs.zsh.shellAliases = {
    rebuild =
      "nix flake update ~/.config/nix && darwin-rebuild switch --flake ~/.config/nix";
  };
}
