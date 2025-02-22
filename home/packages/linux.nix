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

    clang-tools
    ghc
    haskell-language-server

    mangohud
    protonup
    hyprpanel
    ags

    spotify

    inputs.zen-browser.packages."${system}".default
    obs-studio
    openrgb-with-all-plugins
    firefox
    vesktop
    webcord
    imv # image viewer
    libnotify
    mpv # video player
    ncdu # disk space
    steam
    chromium
    google-chrome
    qutebrowser
    telegram-desktop
    lutris
    qbittorrent
    obsidian
    bottles
  ]);
}
