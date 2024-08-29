{ pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    git
    neovim
    jankyborders
    raycast
    iterm2
    # arc-browser
  ];
}
