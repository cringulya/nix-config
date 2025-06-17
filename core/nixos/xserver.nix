{ pkgs, username, ... }:

{
  services = {
    xserver = {
      enable = true;
      xkb.layout = "us";
    };

    libinput = { enable = true; };

    displayManager = {
      autoLogin = {
        enable = true;
        user = "${username}";
      };
      sddm = {
        enable = true;
        wayland.enable = true;
      };
    };
  };

  # To prevent getting stuck at shutdown
  systemd.extraConfig = "DefaultTimeoutStopSec=10s";
}
