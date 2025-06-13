{ pkgs }:

let
  wallpapers_path = "~/wallpapers";
  wallpapers_folder = "~/wallpapers/others";
in
pkgs.writeShellScriptBin "wall-picker" ''
  wallpaper_name="$(ls ${wallpapers_folder} | ${pkgs.wofi}/bin/wofi --show dmenu --sort-order=alphabetical)"
  if [[ -f ${wallpapers_folder}/$wallpaper_name ]];
  then
  rm .cache/wallpaper
  ln -s ${wallpapers_folder}/wallpaper_name $HOME/.cache/wallpaper
  ${pkgs.swww}/bin/swww img $HOME/.cache/wallpaper
  else
  exit 1
  fi
''
