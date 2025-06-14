{ pkgs, ... }:

{
  imports = [
    ../common
    ../../modules/sketchybar
  ];

  home.username = "artemson";
  home.homeDirectory = "/Users/artemson";


  home.file.".config/aerospace/aerospace.toml".source = ./aerospace/aerospace.toml;

  programs.zsh = {
    # for vimtex zathura
    initExtra = ''
      export DBUS_SESSION_BUS_ADDRESS="unix:path=$DBUS_LAUNCHD_SESSION_BUS_SOCKET"
    '';

    shellAliases = {
      rebuild = "darwin-rebuild switch --flake ~/.config/nix";
    };
  };
  programs.fish = {
    shellInit = ''
      export MallocNanoZone='0'
      export DBUS_SESSION_BUS_ADDRESS="unix:path=$DBUS_LAUNCHD_SESSION_BUS_SOCKET"
    '';
    shellAliases = {
      rebuild = "darwin-rebuild switch --flake ~/.config/nix";
    };
  };
}
