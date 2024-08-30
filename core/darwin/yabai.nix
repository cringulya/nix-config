{ pkgs, ... }:

{
  services.yabai = {
    enable = true;
    enableScriptingAddition = true;
    extraConfig = ''
      yabai -m signal --add event=dock_did_restart action="sudo yabai --load-sa"
      sudo yabai --load-sa
      yabai -m config debug_output on

      yabai -m config layout bsp
      yabai -m config window_placement second_child

      yabai -m config external_bar all:30:0

      yabai -m config top_padding 5
      yabai -m config bottom_padding 5
      yabai -m config left_padding 5
      yabai -m config right_padding 5
      yabai -m config window_gap 5

      yabai -m config window_animation_duration 0.4
      yabai -m config window_animation_easing ease_out_quint
      yabai -m config mouse_follows_focus off
      yabai -m config focus_follows_mouse autoraise
      yabai -m config window_origin_display default
      yabai -m config window_placement second_child
      yabai -m config window_topmost off
      yabai -m config window_shadow on
      yabai -m config window_opacity on
      yabai -m config window_opacity_duration 0.3
      yabai -m config active_window_opacity 0.95
      yabai -m config normal_window_opacity 0.80
      yabai -m config window_border on
      yabai -m config insert_feedback_color 0xffd75f5f
      yabai -m config split_ratio 0.50
      yabai -m config menubar_opacity 1.0

      # when window is dropped in center of another window, swap them (on edges it will split it)
      yabai -m mouse_drop_action swap

      # set mouse interaction modifier key (default: fn)
      yabai -m config mouse_modifier alt
      # set modifier + left-click drag to move window (default: move)
      yabai -m config mouse_action1 move
      # set modifier + right-click drag to resize window (default: resize)
      yabai -m config mouse_action2 resize

      # modify window shadows (default: on, options: on, off, float)
      # example: show shadows only for floating windows
      yabai -m config window_shadow float

      # yabai -m signal --add event=application_launched action="yabai -m window --focus"

      # focus window after active space changes
      yabai -m signal --add event=space_changed action="yabai -m window --focus \$(yabai -m query --windows --space | jq .[-1].id)"

      # focus window after active display changes
      yabai -m signal --add event=display_changed action="yabai -m window --focus \$(yabai -m query --windows --space | jq .[-1].id)"

      yabai -m rule --add app="^Arc$" opacity=0.98 space=^2
      yabai -m rule --add app="^Spotify$" space=^5

      borders active_color=0x9c6942f5 inactive_color=0xff494d64 width=5.0 &
    '';
  };
}
