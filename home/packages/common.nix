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
    ninja
    cargo
    gnumake
    lua5_1
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
    pandoc

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

    # inputs.nixvim-flake.packages.${pkgs.system}.default
    nerd-fonts.jetbrains-mono
    inputs.ghostty.packages.${pkgs.system}.default

  ];

  programs.neovim = {
    enable = true;
    extraLuaPackages = ps: [ ps.magick ];
    extraPackages = with pkgs; [
      imagemagick
      imagemagick
      ruff
      lua-language-server
      stylua
      luarocks
      tree-sitter
      texlab
      nil
    ];
  };
}
