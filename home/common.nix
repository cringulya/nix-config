{ pkgs, ... }:

{
  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "23.11";
  programs.home-manager.enable = true;

  imports =
    [ ./packages/common.nix ./zathura ./starship ./fish ./zsh ./clangd-format ];

  fonts.fontconfig.enable = true;

  home.sessionVariables = { EDITOR = "nvim"; };

  programs.git = {
    enable = true;
    userName = "p0pusk";
    userEmail = "s0sis0n@yandex.ru";
  };

  nixpkgs = {
    config = {
      allowUnfree = true;
      allowUnfreePredicate = _: true;
    };
  };
}
