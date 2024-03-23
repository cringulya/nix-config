{ pkgs, ... }:

{
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    wget
    sbctl
    git
    neovim
    wofi
    btop
    killall
    firefox
    pavucontrol
    pamixer
    home-manager
    nix-prefetch-git
    wl-clipboard

    #sddm-theme dependencies
    libsForQt5.qt5.qtquickcontrols2
    libsForQt5.qt5.qtgraphicaleffects
  ];
}
