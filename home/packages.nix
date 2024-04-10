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
    neofetch

    wlogout
    swww
    grimblast
    slurp

    gcc
    cargo
    gnumake
    python3
    lua
    julia
    nodePackages.npm
    clang-tools
    cmake
    gdb
    texliveFull

    #nvim
    stylua
    nil
    lua-language-server
    texlab


    obs-studio
    firefox
    spotify
    yazi
    telegram-desktop
    vesktop
    ffmpeg
    teams-for-linux
    imv # image viewer
    libnotify
    man-pages # extra man pages
    mpv # video player
    ncdu # disk space

    antlr4

    cm_unicode
  ]);
}
