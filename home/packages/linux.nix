{ pkgs, ... }:

{
  home.packages = (with pkgs; [
    neofetch

    wlogout
    swww
    grimblast
    slurp

    zlib

    obs-studio
    libreoffice-fresh
    openrgb-with-all-plugins
    firefox
    brave
    vesktop
    teams-for-linux
    imv # image viewer
    libnotify
    mpv # video player
    ncdu # disk space
    steam
    telegram-desktop

    cm_unicode
  ]);
}
