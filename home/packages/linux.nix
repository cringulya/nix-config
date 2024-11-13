{ pkgs, inputs, ... }:

{
  home.packages = (with pkgs; [
    neofetch

    wlogout
    swww
    grimblast
    slurp
    gdb
    gf
    docker

    mangohud
    protonup
    hyprpanel
    ags

    inputs.zen-browser.packages."${system}".default
    obs-studio
    libreoffice-fresh
    openrgb-with-all-plugins
    firefox
    vesktop
    webcord
    imv # image viewer
    libnotify
    mpv # video player
    ncdu # disk space
    steam
    telegram-desktop
    vscode
  ]);
}
