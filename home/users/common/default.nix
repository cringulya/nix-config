{ pkgs
, system
, inputs
, ...
}:

{
  programs.home-manager.enable = true;

  imports = [
    ./email.nix
    ../../modules/aerc
    ../../modules/zathura
    ../../modules/starship
    ../../modules/syncthing
    ../../modules/neomutt
    ../../modules/neovim
    ../../modules/neovide
    ../../modules/ghostty
    ../../modules/fish
    ../../modules/zsh
    ../../modules/clangd-format
    ../../modules/tmux
    ../../modules/kitty
    ../../modules/ssh
    ../../modules/latexindent
    ../../modules/yazi
  ];

  fonts.fontconfig.enable = true;

  programs = {
    git = {
      enable = true;
      userName = "Artem Son";
      userEmail = "s0sis0n@yandex.ru";
    };

    zoxide = {
      enable = true;
      enableZshIntegration = true;
      enableFishIntegration = true;
    };
  };

  home.packages = with pkgs; [
    zip
    unzip
    fzf
    fd
    todo
    bat
    eza
    dust
    ripgrep
    starship
    wget
    zoxide
    gh
    tree
    nix-prefetch-git
    pokemon-colorscripts-mac

    ghc
    hlint
    haskellPackages.stack
    haskell-language-server
    jdk
    maven
    gradle
    cachix
    ninja
    cargo
    gnumake
    lldb
    nodejs-slim
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

    spoofdpi
    openvpn
    yazi
    ffmpeg
    man-pages # extra man pages
    libtool
    pandoc
    asciidoctor-with-extensions

    uv
    (python3.withPackages (
      python-pkgs: with python-pkgs; [
        matplotlib
        pandas
        numpy
      ]
    ))

    # inputs.nixvim-flake.packages.${pkgs.system}.default
    nerd-fonts.jetbrains-mono
    lmodern
    libertinus
    cm_unicode
  ];

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "23.11";
}
