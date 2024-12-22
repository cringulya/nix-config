{ pkgs, inputs, ... }:

{
  home.packages = (with pkgs; [
    neofetch

    wlogout
    swww
    grimblast
    slurp
    gdb
    gf
    docker

    clang-tools
    llvm_18
    haskell.compiler.ghc947
    haskell.packages.ghc947.haskell-language-server

    mangohud
    protonup
    hyprpanel
    ags

    spotify

    inputs.zen-browser.packages."${system}".default
    obs-studio
    openrgb-with-all-plugins
    firefox
    vesktop
    webcord
    imv # image viewer
    libnotify
    mpv # video player
    ncdu # disk space
    steam
    chromium
    google-chrome
    telegram-desktop
    vscode
    lutris
    bottles
  ]);
}
