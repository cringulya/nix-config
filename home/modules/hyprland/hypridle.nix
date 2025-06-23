{
  programs.hyprlock.enable = true;

  services.hypridle = {
    enable = true;
    settings = {
      listener =
        [
          {
            timeout = 900; # 15min
            on-timeout = "hyprlock"; # lock screen when timeout has passed
          }

          {
            timeout = 930; # 15.5min
            on-timeout = "hyprctl dispatch dpms off"; # screen off when timeout has passed
            on-resume = "hyprctl dispatch dpms on"; # screen on when activity is detected after timeout has fired.
          }

          {
            timeout = 1800; # 30min
            on-timeout = "systemctl suspend"; # suspend pc
          }
        ];
    };
  };
}
