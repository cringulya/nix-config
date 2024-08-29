{ pkgs, ... }:

{
  imports = [
    ./common.nix
    ./packages/linux.nix
    ./style.nix
    ./hyprland
    ./kitty
    ./waybar
    ./wofi
    ./btop
    ./mako
    ./scripts
    ./wlogout
  ];

  home.username = "artemson";
  home.homeDirectory = "/home/artemson";

  home.file.".wallpapers".source = ../wallpapers;

  home.sessionVariables = {
    DEFAULT_BROWSER = "${pkgs.firefox}/bin/firefox";
  };

  programs = {
    firefox.enable = true;
  };

  systemd.user.startServices = "sd-switch";
}
