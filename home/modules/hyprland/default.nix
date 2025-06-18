{ pkgs, inputs, ... }:

{
  imports = [
    ./startup.nix
    ./settings.nix
    ./hypridle.nix
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
    xwayland = {
      enable = true;
      # hidpi = true;
    };
    systemd.enable = true;
  };
}
