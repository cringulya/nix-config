{ pkgs, inputs, ... }:

{
  imports = [
    ./startup.nix
    ./settings.nix
    ./keybindings.nix
    ./animations.nix
    ./windowrules.nix
    ./variables.nix
    ./theme.nix
  ];

  systemd.user.targets.hyprland-session.Unit.Wants =
    [ "xdg-desktop-autostart.target" ];

  wayland.windowManager.hyprland = {
    enable = true;
    # package =
    #   inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    # extraPortals =
    #   [ pkgs.xdg-desktop-portal-hyprland pkgs.xdg-desktop-portal-gtk ];
    xwayland = {
      enable = true;
      # hidpi = true;
    };
    systemd.enable = true;
  };
}
