{
  wayland.windowManager.hyprland.settings = {
    exec-once = [
      "hash dbus-update-activation-environment 2>/dev/null &"
      "dbus-update-activation-environment --systemd &"
      "systemctl --user import-environment PATH"
      "nm-applet"
      "wl-paste --primary --watch wl-copy --primary --clear"
      "sleep 1 && swaylock"
      "hyprpanel"
      "swww init"
      "sleep 1"
      "swww img ${../../wallpapers/chika-fujiwara-3840x2160-16148.jpg}"
    ];
  };
}
