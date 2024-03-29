{ pkgs, ... }:

{
  home.packages = (with pkgs; [
    unzip
    fish
    fzf
    todo
    ripgrep
    starship
    wget

    wlogout
    swww
    grimblast
    slurp

    gcc
    cargo
    gnumake
    python3
    lua
    nodePackages.npm
    clang-tools
    cmake
    gdb

    #nvim
    stylua
    lua-language-server

    obs-studio
    firefox
    spotify
    yazi
    telegram-desktop
    vesktop
    ffmpeg
    zathura
    teams-for-linux
    imv # image viewer
    libnotify
    man-pages # extra man pages
    mpv # video player
    ncdu # disk space
  ]);
}
