{ pkgs, inputs, ... }:

{
  imports = [
    ../common
    ../../modules/hyprland
    ../../modules/hyprpanel
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
    STEAM_EXTRA_COMPAT_TOOLS_PATHS = "\${HOME}/.steam/root/compatabilitytools.d";
  };

  services.mbsync = {
    enable = true;
    postExec = "${pkgs.writeShellScript "mbsync-notify" ''
      NEW=$(find ~/Maildir -type f -path "*/new/*" | wc -l)
      if [ "$NEW" -gt 0 ]; then
        notify-send "📬 New Mail" "You have $NEW new messages"
      fi
    ''}";
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

  home.packages = (
    with pkgs;
    [
      neofetch

      wlogout
      hyprsunset
      swww
      grimblast
      slurp
      gdb
      gf
      docker
      networkmanagerapplet
      pgadmin4-desktopmode

      clang-tools
      antlr

      nomachine-client
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
      telegram-desktop
      qbittorrent
      obsidian
    ]
  );
}
