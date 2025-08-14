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
}
