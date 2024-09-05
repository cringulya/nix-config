{ pkgs, inputs, ... }:

{
  home.packages = with pkgs; [
    unzip
    fzf
    fd
    todo
    ripgrep
    starship
    wget
    zoxide
    tree

    gcc
    cargo
    gnumake
    lua
    lldb
    nodejs
    nodePackages.npm
    clang-tools
    cmake
    neovide

    latexrun
    texlive.combined.scheme-full

    ffmpeg
    man-pages # extra man pages

    (pkgs.python3.withPackages (python-pkgs: [
      python-pkgs.pip
      python-pkgs.virtualenv
      python-pkgs.pandas
      python-pkgs.numpy
      python-pkgs.scikit-learn
      python-pkgs.torch
      python-pkgs.torchaudio
      python-pkgs.librosa
      python-pkgs.xgboost
    ]))

    spotify
    yazi

    inputs.nixvim-flake.packages.${pkgs.system}.default
    (pkgs.nerdfonts.override { fonts = [ "JetBrainsMono" "Iosevka" ]; })
  ];

}
