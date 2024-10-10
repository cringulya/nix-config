{ pkgs, ... }:

{
  imports = [ ./common.nix ./sketchybar ./packages/darwin.nix ];

  home.username = "artemson";
  home.homeDirectory = "/Users/artemson";

  programs.zsh = {
    # for vimtex zathura
    initExtra = ''
      export DBUS_SESSION_BUS_ADDRESS="unix:path=$DBUS_LAUNCHD_SESSION_BUS_SOCKET"
    '';

    shellAliases = {
      rebuild = ''
        nix flake lock --update-input nixvim-flake ~/.config/nix &&
        darwin-rebuild switch --flake ~/.config/nix'';
    };
  };
}
