{ pkgs, username, ... }:

{
  services = {
    xserver = {
      enable = true;
      xkb.layout = "us";
    };

    libinput = { enable = true; };

    displayManager = {
      sddm = {
        enable = true;
        wayland.enable = true;
        theme = "${import ./sddm-theme.nix { inherit pkgs; }}";
      };

      autoLogin = {
        enable = true;
        user = "${username}";
      };
    };
  };

  # To prevent getting stuck at shutdown
  systemd.extraConfig = "DefaultTimeoutStopSec=10s";
}
