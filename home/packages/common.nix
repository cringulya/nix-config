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

    lua-language-server
    stylua
    luarocks
    tree-sitter
    texlab
    nil

    devenv
    cachix
    hlint
    haskellPackages.stack
    ninja
    cargo
    gnumake
    lua
    lldb
    nodejs
    nodePackages.npm
    cmake
    ghostscript

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
    pyright
    uv
    (python3.withPackages (python-pkgs:
      with python-pkgs; [
        pip
        cvxopt
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

    neovim
    # inputs.nixvim-flake.packages.${pkgs.system}.default
    nerd-fonts.jetbrains-mono
  ];
}
