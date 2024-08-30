{ inputs, pkgs, ... }: {

  users.users.artemson = {
    name = "artemson";
    home = "/Users/artemson";
    shell = pkgs.fish;
  };

  # Auto upgrade nix package and the daemon service.
  services.nix-daemon.enable = true;
  nix.package = pkgs.nix;

  # Necessary for using flakes on this system.
  nix.settings.experimental-features = "nix-command flakes";

  # Create /etc/zshrc that loads the nix-darwin environment.
  programs.zsh.enable = true; # default shell on catalina
  programs.fish.enable = true;

  # Set Git commit hash for darwin-version.
  system.configurationRevision = inputs.rev or inputs.dirtyRev or null;

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 4;

  # The platform the configuration will be used on.
  nixpkgs.hostPlatform = "aarch64-darwin";
  nix.extraOptions = ''
    extra-platforms = x86_64-darwin aarch64-darwin
  '';

  imports = [
    ./preferences.nix
    ./packages.nix
    ./homebrew.nix
    ./yabai.nix
    ./skhd.nix
  ];

  services.sketchybar = {
    enable = true;
  };
}