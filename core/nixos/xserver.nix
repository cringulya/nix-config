{ pkgs, username, ... }:

{
  services = {
    xserver = {
      enable = true;
      xkb.layout = "us";
    };

    libinput = {
      enable = true;
    };

    displayManager = {
      autoLogin = {
        enable = true;
        user = "${username}";
      };
    };
  };

  # To prevent getting stuck at shutdown
  systemd.settings.Manager = {
    "DefaultTimeoutStopSec" = "10s";
  };
}
