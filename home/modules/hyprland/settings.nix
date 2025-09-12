{
  wayland.windowManager.hyprland.settings = {
    monitor = [
      "DP-5,3840x2160@240,1920x0,1.5"
      "DP-7, 1920x1080, 0x0, auto"
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

    misc = {
      vrr = 0;
      focus_on_activate = true;
      mouse_move_enables_dpms = true;
      key_press_enables_dpms = true;
    };
  };
}
