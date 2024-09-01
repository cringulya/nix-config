{ pkgs, username, ... }:

{
  services.xserver = {
    enable = true;
    xkb.layout = "us";

    displayManager.sddm = {
      enable = true;
      wayland.enable = true;
      theme = "${import ./sddm-theme.nix { inherit pkgs; }}";
    };
  };

  services.libinput = { enable = true; };

  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
    theme = "${import ./sddm-theme.nix { inherit pkgs; }}";
  };

  services.displayManager.autoLogin = {
    enable = true;
    user = "${username}";
  };

  # To prevent getting stuck at shutdown
  systemd.extraConfig = "DefaultTimeoutStopSec=10s";
}
