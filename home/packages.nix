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
    lua
    julia-bin
    nodejs
    nodePackages.npm
    clang-tools
    cmake
    gdb
    texliveFull
    cudaPackages.cuda_nvcc

    (pkgs.python3.withPackages (python-pkgs: [
      python-pkgs.pip
      python-pkgs.virtualenv
      python-pkgs.pandas
      python-pkgs.numpy
      python-pkgs.scikit-learn
      python-pkgs.torch
      python-pkgs.torch-audiomentations
      python-pkgs.torchaudio
      python-pkgs.librosa
      python-pkgs.xgboost
    ]))
    zlib

    #nvim
    stylua
    nil
    nixpkgs-fmt
    lua-language-server
    texlab
    pyright
    black


    obs-studio
    libreoffice-fresh
    openrgb-with-all-plugins
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
    steam

    cm_unicode
  ]);
}
