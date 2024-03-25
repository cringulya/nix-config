{
  wayland.windowManager.hyprland.settings = {
    "$mainMod" = "SUPER";
    "$term" = "kitty";
    "$file" = "kitty -- yazi";
    "$browser" = "firefox";

    bind = [
      "ALT, space, exec, pkill wofi || wofi --show drun"

      "$mainMod, W, togglefloating," # toggle the window on focus to float
      "$mainMod, G, togglegroup," # toggle the window on focus to float
      "$mainMod, F, fullscreen," # toggle the window on focus to fullscreen
      "$mainMod, P, pin"
      "$mainMod, backspace, exec, wlogout"
      "$mainMod, B, exec, killall .waybar-wrapped || waybar" # toggle waybar

      # Application shortcuts
      "$mainMod, return, exec, $term" # open terminal
      "$mainMod SHIFT, E, exec, $file" # open file manager
      "$mainMod, E, exec, $browser" # open browser
      "CTRL SHIFT, ESCAPE, exec, kitty -- btop"


      "$mainMod, q, killactive,"
      ", mouse:274 mouse:273, killactive,"

      "$mainMod, h, movefocus, l"
      "$mainMod, l, movefocus, r"
      "$mainMod, k, movefocus, u"
      "$mainMod, j, movefocus, d"

      # Switch workspaces with mainMod + [0-9]
      "$mainMod, 1, workspace, 1"
      "$mainMod, 2, workspace, 2"
      "$mainMod, 3, workspace, 3"
      "$mainMod, 4, workspace, 4"
      "$mainMod, 5, workspace, 5"
      "$mainMod, 6, workspace, 6"
      "$mainMod, 7, workspace, 7"
      "$mainMod, 8, workspace, 8"
      "$mainMod, 9, workspace, 9"
      "$mainMod, 0, workspace, 10"

      # Switch workspaces relative to the active workspace with mainMod + CTRL + [←→]
      "$mainMod CTRL, right, workspace, r+1"
      "$mainMod CTRL, left, workspace, r-1"

      "ALT, j, workspace, e+1"
      "ALT, k, workspace, e-1"
      "ALT, l, workspace, r+1"
      "ALT, h, workspace, r-1"

      # move to the first empty workspace instantly with mainMod + CTRL + [↓]
      "$mainMod CTRL, down, workspace, empty"


      # Move active window to a workspace with mainMod + SHIFT + [0-9]
      "$mainMod SHIFT, 1, movetoworkspace, 1"
      "$mainMod SHIFT, 2, movetoworkspace, 2"
      "$mainMod SHIFT, 3, movetoworkspace, 3"
      "$mainMod SHIFT, 4, movetoworkspace, 4"
      "$mainMod SHIFT, 5, movetoworkspace, 5"
      "$mainMod SHIFT, 6, movetoworkspace, 6"
      "$mainMod SHIFT, 7, movetoworkspace, 7"
      "$mainMod SHIFT, 8, movetoworkspace, 8"
      "$mainMod SHIFT, 9, movetoworkspace, 9"
      "$mainMod SHIFT, 0, movetoworkspace, 10"

      # Move active window to a relative workspace with mainMod + CTRL + ALT + [←→]
      "$mainMod SHIFT CTRL, l, movetoworkspace, r+1"
      "$mainMod SHIFT CTRL, h, movetoworkspace, r-1"

      # Move active window around current workspace with mainMod + SHIFT + CTRL [←→↑↓]
      "$mainMod SHIFT, h, movewindow, l"
      "$mainMod SHIFT, l, movewindow, r"
      "$mainMod SHIFT, k, movewindow, u"
      "$mainMod SHIFT, j, movewindow, d"

      # Scroll through existing workspaces with mainMod + scroll
      "$mainMod, mouse_down, workspace, e-1"
      "$mainMod, mouse_up, workspace, e+1"

      "$mainMod, tab, workspace, e+1"
      "$mainMod shift, tab, workspace, e-1"
      "ALT, tab, workspace, previous"

      # sound
      ", XF86AudioMute, exec, pamixer -t"
      ", XF86AudioMicMute, exec, ~/.config/hypr/scripts/volumecontrol.sh -i m " # toggle microphone mute
      ", XF86AudioLowerVolume, exec, pamixer -d 5"
      ", XF86AudioRaiseVolume, exec, pamixer -i 5"
      ", XF86AudioPlay, exec, playerctl play-pause"
      ", XF86AudioPause, exec, playerctl play-pause"
      ", XF86AudioNext, exec, playerctl next"
      ", XF86AudioPrev, exec, playerctl previous"


      # Special workspaces (scratchpad)
      "$mainMod, m, movetoworkspacesilent, special"
      "$mainMod, S, togglespecialworkspace,"

      # Toggle Layout
      "$mainMod, i, togglesplit, # dwindle"
      "$mainMod, i, layoutmsg, orientationnext #master"
      "$mainMod, o, layoutmsg, orientationprev #master"

      # Move window silently to workspace Super + Alt + [0-9]
      "$mainMod ALT, 1, movetoworkspacesilent, 1"
      "$mainMod ALT, 2, movetoworkspacesilent, 2"
      "$mainMod ALT, 3, movetoworkspacesilent, 3"
      "$mainMod ALT, 4, movetoworkspacesilent, 4"
      "$mainMod ALT, 5, movetoworkspacesilent, 5"
      "$mainMod ALT, 6, movetoworkspacesilent, 6"
      "$mainMod ALT, 7, movetoworkspacesilent, 7"
      "$mainMod ALT, 8, movetoworkspacesilent, 8"
      "$mainMod ALT, 9, movetoworkspacesilent, 9"
      "$mainMod ALT, 0, movetoworkspacesilent, 10"

    ];

    # Trigger when the switch is turning off 
    bindl = [ ", switch:on:Lid Switch, exec, swaylock && systemctl suspend" ];

    binde = [
      # Resize windows
      "$mainMod CTRL, l, resizeactive, 10 0"
      "$mainMod CTRL, h, resizeactive, -10 0"
      "$mainMod CTRL, k, resizeactive, 0 -10"
      "$mainMod CTRL, j, resizeactive, 0 10"

    ];

    bindm = [
      # Move/Resize windows with mainMod + LMB/RMB and dragging
      "$mainMod, mouse:272, movewindow"
      "$mainMod, mouse:273, resizewindow"
      ",mouse:274, movewindow"
    ];
  };
}
