{ pkgs, ... }:

{
  wayland.windowManager.hyprland.settings = {
    exec-once = [
      "hash dbus-update-activation-environment 2>/dev/null &"
      "dbus-update-activation-environment --systemd &"
      "systemctl --user import-environment PATH"
      "nm-applet"
      "wl-paste --primary --watch wl-copy --primary --clear"
      "swww-daemon"
      "sleep 1 && hyprlock"
      "hyprpanel"
      "Telegram"
      "spotify"
      "ghostty"
    ];
  };
}
