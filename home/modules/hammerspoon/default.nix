{ pkgs, ... }:

{
  home.file.".hammerspoon/init.lua".source = ./init.lua;
  home.file.".hammerspoon/Spoons/Swipe.spoon" = {
    source = ./Swipe.spoon;
    recursive = true;
  };
}
