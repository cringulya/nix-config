{ pkgs, inputs, ... }:

{
  imports = [
    ../common
    ../../modules/hyprland
    ../../modules/waybar
    ../../modules/rofi
    ../../modules/btop
    ../../modules/scripts
    ../../modules/swaylock
    ../../modules/wlogout
    ../../modules/mimeapps
  ];

  home = {
    username = "artemson";
    homeDirectory = "/home/artemson";
  };

  home.sessionVariables = {
    STEAM_EXTRA_COMPAT_TOOLS_PATHS =
      "\${HOME}/.steam/root/compatabilitytools.d";
  };

  programs = {
    zsh = {
      shellAliases = {
        rebuild = "sudo nixos-rebuild switch --upgrade --flake ~/.config/nix";
      };
    };
    fish = {
      shellAliases = {
        rebuild = "sudo nixos-rebuild switch --upgrade --flake ~/.config/nix";
      };
    };
  };

  systemd.user.startServices = "sd-switch";
  services.mbsync.enable = true;

  home.packages = (with pkgs; [
    neofetch

    wlogout
    hyprsunset
    swww
    grimblast
    slurp
    gdb
    gf
    docker

    clang-tools
    antlr

    mangohud
    protonup

    spotify

    obs-studio
    openrgb-with-all-plugins
    firefox
    vesktop
    webcord
    imv # image viewer
    libnotify
    mpv # video player
    ncdu # disk space
    steam
    chromium
    google-chrome
    qutebrowser
    telegram-desktop
    lutris
    qbittorrent
    obsidian
    bottles

    inputs.zen-browser.packages."${pkgs.system}".default
  ]);
}
