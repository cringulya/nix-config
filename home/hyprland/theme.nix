{ config, ... }:

{
  stylix.targets.hyprland.enable = false;
  wayland.windowManager.hyprland.settings = {
    general = {
      gaps_in = 5;
      gaps_out = 10;
      border_size = 4;
      "col.active_border" = "rgba(33ccffee) rgba(00ff99ee) 45deg";
      "col.inactive_border" = "rgba(595959aa)";

      allow_tearing = true;
      resize_on_border = true;
    };

    decoration = {
      active_opacity = 0.9;
      inactive_opacity = 0.9;
      dim_inactive = false;
      dim_strength = 0.2;
      rounding = 5;
      blur = {
        enabled = true;
        brightness = 1.0;
        contrast = 1.0;
        noise = 2.0e-2;

        passes = 3;
        size = 10;
      };

      shadow = {
        enabled = true;
        ignore_window = true;
        offset = "0 2";
        range = 20;
        render_power = 3;
      };
      # "col.shadow" = "rgba(00000055)";
    };

    blurls = "waybar";
  };
}
