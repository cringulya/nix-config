{ pkgs, ... }:

{
  home.packages = (with pkgs; [
    unzip
    fzf
    fd
    todo
    ripgrep
    starship
    wget

    gcc
    cargo
    gnumake
    lua
    lldb
    julia-bin
    nodejs
    nodePackages.npm
    clang-tools
    cmake
    texliveFull
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

    #nvim
    stylua
    nil
    nixpkgs-fmt
    lua-language-server
    texlab
    pyright
    black
    tree-sitter

    spotify
    yazi
    telegram-desktop

    (pkgs.nerdfonts.override { fonts = [ "JetBrainsMono" "Iosevka" ]; })
  ]);
}
