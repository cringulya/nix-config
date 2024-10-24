{ pkgs, inputs, ... }:

{
  imports = [
    ./common.nix
    ./packages/linux.nix
    ./hyprland
    ./kitty
    ./waybar
    ./wofi
    ./rofi
    ./btop
    ./mako
    ./scripts
    ./wlogout
    ./mimeapps
  ];

  home = {
    username = "artemson";
    homeDirectory = "/home/artemson";
  };

  home.file.".wallpapers".source = ../wallpapers;

  home.sessionVariables = {
    DEFAULT_BROWSER =
      "${inputs.zen-browser.packages.${pkgs.system}.default}/bin/zen";
    STEAM_EXTRA_COMPAT_TOOLS_PATHS =
      "\${HOME}/.steam/root/compatibilitytools.d";
  };

  programs.zsh.shellAliases = {
    rebuild = ''
      nix flake lock --update-input nixvim-flake ~/.config/nix &&
      sudo nixos-rebuild switch --upgrade --flake ~/.config/nix'';
  };

  systemd.user.startServices = "sd-switch";
}
