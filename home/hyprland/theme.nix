{ config, ... }:

{
  stylix.targets.hyprland.enable = false;
  wayland.windowManager.hyprland.settings = {
    general = {
      gaps_in = 2;
      gaps_out = 5;
      border_size = 5;
      "col.active_border" =
        "rgba(${config.lib.stylix.colors.base0C}ff) rgba(${config.lib.stylix.colors.base0D}ff) 45deg";
      "col.inactive_border" = "rgba(565f89cc) rgba(9aa5cecc) 45deg";

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

      drop_shadow = true;
      shadow_ignore_window = true;
      shadow_offset = "0 2";
      shadow_range = 20;
      shadow_render_power = 3;
      # "col.shadow" = "rgba(00000055)";
    };

    blurls = "waybar";
  };
}
