{ pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    git
    neovim
    iterm2
    kitty
    clang
    # arc-browser
    # raycast
  ];
}
