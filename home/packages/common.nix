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
    gh
    tree
    nix-prefetch-git
    pokemon-colorscripts-mac


    ghc
    haskell-language-server
    jdk
    maven
    gradle
    devenv
    cachix
    hlint
    haskellPackages.stack
    ninja
    cargo
    gnumake
    lldb
    nodejs
    nodePackages.npm
    cmake
    ghostscript

    # mail
    mu
    cron
    pass
    gnupg
    isync

    latexrun
    pplatex
    texlive.combined.scheme-full
    texlivePackages.termes-otf
    typst
    tinymist

    pgadmin4
    spoofdpi
    yazi
    ffmpeg
    man-pages # extra man pages
    libtool
    pandoc
    asciidoctor-with-extensions

    uv
    (python3.withPackages (python-pkgs:
      with python-pkgs; [
        jupyterlab
        matplotlib
        pandas
        numpy
      ]))

    # inputs.nixvim-flake.packages.${pkgs.system}.default
    nerd-fonts.jetbrains-mono
    lmodern
    libertinus
    cm_unicode
  ];

  programs.neovim = {
    enable = true;
    extraLuaPackages = ps: [ ps.magick ];
    extraPackages = with pkgs; [
      lua5_1
      imagemagick
      ruff
      lua-language-server
      stylua
      prettierd
      luarocks
      tree-sitter
      texlab
      nil
      marksman
      pyright
      nixpkgs-fmt
      jdt-language-server
      tinymist
    ];
  };
}
