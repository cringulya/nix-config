{ pkgs }:

let
  wallpapers_folder = "~/.wallpapers";
in
pkgs.writeShellScriptBin "set-wallpaper" ''
  if  [-e "$HOME/.cache/wallpaper" ]; then
  ${pkgs.swww}/bin/swww img $HOME/.cache/wallpaper
  else
  rand_wall=$(find ${wallpapers_folder} -maxdepth 1 -type f)
  ln -s rand_wall $HOME/.cache/wallpaper
  ${pkgs.swww}/bin/swww img $HOME/.cache/wallpaper
  fi
''
