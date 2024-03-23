{
  wayland.windowManager.hyprland.settings = {
    monitor = [
      "HDMI-A-1,highrr,1080x0,auto"
      "DP-2, 1920x1080, 0x-420, 1, transform, 1"
    ];

    input = {
      kb_layout = "us, ru";
      kb_options = "caps:escape, grp:win_space_toggle";

      touchpad.natural_scroll = "no";
      sensitivity = 0;
      force_no_accel = 1;
    };

    gestures = {
      workspace_swipe = true;
      workspace_swipe_fingers = 3;
    };

    binds.allow_workspace_cycles = true;

    dwindle = {
      pseudotile = "yes";
      preserve_split = "yes";
    };

    master = {
      new_is_master = false;
    };

    misc = {
      vrr = 0;
      focus_on_activate = true;
    };
  };
}
