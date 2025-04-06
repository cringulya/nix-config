{ pkgs, inputs, ... }:

{
  imports = [
    ./common.nix
    ./packages/linux.nix
    ./hyprland
    ./kitty
    ./waybar
    ./rofi
    ./btop
    ./scripts
    ./wlogout
    ./mimeapps
  ];

  home = {
    username = "artemson";
    homeDirectory = "/home/artemson";
  };

  home.sessionVariables = {
    DEFAULT_BROWSER =
      "${pkgs.firefox}/bin/firefox";
    STEAM_EXTRA_COMPAT_TOOLS_PATHS =
      "\${HOME}/.steam/root/compatibilitytools.d";
  };

  programs.zsh = {
    shellAliases = {
      rebuild = "sudo nixos-rebuild switch --upgrade --flake ~/.config/nix";
    };
    # initExtra = ''
    #   export CXX=${pkgs.clang}/bin/clang++
    # '';
  };
  programs.fish = {
    shellAliases = {
      rebuild = "sudo nixos-rebuild switch --upgrade --flake ~/.config/nix";
    };
  };

  systemd.user.startServices = "sd-switch";
  services.mbsync.enable = true;
}
