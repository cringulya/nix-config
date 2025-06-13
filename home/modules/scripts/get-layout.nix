{ pkgs }:

let
  keyboard = "keychron-keychron-q1-keyboard";
in
pkgs.writeShellScriptBin "get-layout" ''
  hyprctl -j devices | ${pkgs.jq}/bin/jq '.keyboards' | ${pkgs.jq}/bin/jq '.[] | select (.name == "${keyboard}")' | awk -F '"' '{if ($2=="active_keymap") print $4}'
''
