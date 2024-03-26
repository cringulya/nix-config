{
  wayland.windowManager.hyprland.settings = {
    exec-once = [
      "nm-applet &"
      "wl-paste --primary --watch wl-copy --primary --clear"
      "sleep 1 && swaylock"
      "waybar &"
      "swww init && swww img ~/wallpapers/waifu_pink.png"
    ];
  };
}
