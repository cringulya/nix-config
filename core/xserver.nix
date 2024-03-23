{ pkgs, username, ... }:

{
  services.xserver = {
    enable = true;
    xkb.layout = "us";
    displayManager.autoLogin = {
      enable = true;
      user = "${username}";
    };

    displayManager.sddm = {
      enable = true;
      wayland.enable = true;
      theme = "${import ./sddm-theme.nix {inherit pkgs;}}";
    };
    libinput = {
      enable = true;
      # mouse = {
      #   accelProfile = "flat";
      # };
    };
  };

  # To prevent getting stuck at shutdown
  systemd.extraConfig = "DefaultTimeoutStopSec=10s";
}
