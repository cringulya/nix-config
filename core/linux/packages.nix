{ pkgs, inputs, ... }:

{
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    wget
    git
    clang
    gcc
    btop
    killall
    pavucontrol
    pamixer
    nix-prefetch-git
    wl-clipboard
    nix-index
  ];
}
