{ ... }:

{
  services.skhd = {
    enable = true;
    skhdConfig = ''
      # open terminal
      alt - return : /Applications/Nix\ Apps/iTerm2.app/Contents/MacOS/iTerm2
      alt - e : open -a /Applications/Arc.app/Contents/MacOS/Arc

      alt + shift - r : yabai --restart-service && sketchybar --reload

      # focus window
      alt - q : yabai -m window --close

      # focus window
      alt - x : yabai -m window --focus recent
      alt - h : yabai -m window --focus west
      alt - j : yabai -m window --focus south
      alt - k : yabai -m window --focus north
      alt - l : yabai -m window --focus east
      alt - z : yabai -m window --focus stack.prev
      alt - c : yabai -m window --focus stack.next

      # swap window
      shift + alt - x : yabai -m window --swap recent
      shift + alt - h : yabai -m window --swap west
      shift + alt - j : yabai -m window --swap south
      shift + alt - k : yabai -m window --swap north
      shift + alt - l : yabai -m window --swap east

      # move window
      shift + cmd - h : yabai -m window --warp west
      shift + cmd - j : yabai -m window --warp south
      shift + cmd - k : yabai -m window --warp north
      shift + cmd - l : yabai -m window --warp east

      # Resize windows
      lctrl + alt - h : yabai -m window --resize left:-50:0; \
                        yabai -m window --resize right:-50:0
      lctrl + alt - j : yabai -m window --resize bottom:0:50; \
                        yabai -m window --resize top:0:50
      lctrl + alt - k : yabai -m window --resize top:0:-50; \
                        yabai -m window --resize bottom:0:-50
      lctrl + alt - l : yabai -m window --resize right:50:0; \
                        yabai -m window --resize left:50:0

      # balance size of windows
      shift + alt - 0 : yabai -m space --balance

      # fast focus desktop
      alt - 1 : yabai -m space --focus  1
      alt - 2 : yabai -m space --focus  2
      alt - 3 : yabai -m space --focus  3
      alt - 4 : yabai -m space --focus  4
      alt - 5 : yabai -m space --focus  5
      alt - 6 : yabai -m space --focus  6
      alt - 7 : yabai -m space --focus  7
      alt - 8 : yabai -m space --focus  8
      alt - 9 : yabai -m space --focus  9
      alt - 0 : yabai -m space --focus 10

      # send window to desktop and follow focus
      shift + alt - 1 : yabai -m window --space 1 --focus
      shift + alt - 2 : yabai -m window --space 2 --focus
      shift + alt - 3 : yabai -m window --space 3 --focus
      shift + alt - 4 : yabai -m window --space 4 --focus
      shift + alt - 5 : yabai -m window --space 5 --focus
      shift + alt - 6 : yabai -m window --space 6 --focus
      shift + alt - 7 : yabai -m window --space 7 --focus
      shift + alt - 8 : yabai -m window --space 8 --focus
      shift + alt - 9 : yabai -m window --space 9 --focus
      shift + alt - 0 : yabai -m window --space 10 --focus


      # toggle window fullscreen zoom
      alt - f : yabai -m window --toggle zoom-fullscreen

      # toggle window native fullscreen
      cmd + ctrl - f : yabai -m window --toggle native-fullscreen

      # toggle window split type
      alt - e : yabai -m window --toggle split

      # float / unfloat window and restore position
      # alt - t : yabai -m window --toggle float && /tmp/yabai-restore/$(yabai -m query --windows --window | jq -re '.id').restore 2>/dev/null || true
      alt - w : yabai -m window --toggle float --grid 4:4:1:1:2:2

      # toggle picture-in-picture
      # toggle sticky (show on all spaces)
      alt - p : yabai -m window --toggle border --toggle pip --toggle sticky
    '';
  };
}
