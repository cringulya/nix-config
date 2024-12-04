{ pkgs, inputs, ... }:

{
  home.packages = with pkgs; [
    zip
    unzip
    fzf
    fd
    todo
    ripgrep
    starship
    wget
    zoxide
    tree
    nix-prefetch-git

    devenv
    cachix
    hlint
    haskellPackages.stack
    haskell.compiler.ghc947
    haskell.packages.ghc947.haskell-language-server
    ninja
    cargo
    gnumake
    lua
    lldb
    nodejs
    nodePackages.npm
    cmake
    ghostscript
    clang-tools

    # mail
    mu
    mutt-wizard
    notmuch
    abook
    msmtp
    cron
    pass
    isync
    lynx

    latexrun
    pplatex
    texlive.combined.scheme-full

    pgadmin4
    spoofdpi
    yazi
    ffmpeg
    man-pages # extra man pages
    libtool

    ruff
    uv
    (python3.withPackages (python-pkgs:
      with python-pkgs; [
        pip
        opencv4
        jupyterlab
        matplotlib
        virtualenv
        pandas
        numpy
        tqdm
        torch-bin
        scikit-learn
      ]))

    inputs.nixvim-flake.packages.${pkgs.system}.default
    (pkgs.nerdfonts.override { fonts = [ "JetBrainsMono" "Iosevka" ]; })
  ];

}
