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
    julia-bin
    nodejs
    nodePackages.npm
    clang-tools
    cmake
    gdb
    texliveFull
    cudaPackages.cuda_nvcc

    #nvim
    stylua
    nil
    nixpkgs-fmt
    lua-language-server
    texlab


    obs-studio
    firefox
    brave
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
