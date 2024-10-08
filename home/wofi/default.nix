{
  imports = [ ./config.nix ];

  stylix.targets.wofi.enable = false;

  programs.wofi = { enable = true; };
}
