{ pkgs, ... }:

{
  nixpkgs.config = {
    allowUnfree = true;
    allowUnfreePredicate = _: true;
    cudaSupport = true;
  };

  environment.systemPackages = with pkgs; [
    git
    iterm2
    kitty
    # arc-browser
    # raycast
  ];
}
