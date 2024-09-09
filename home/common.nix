{ pkgs, ... }:

{
  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "23.11";
  programs.home-manager.enable = true;

  imports = [
    ./packages/common.nix
    ./zathura
    ./starship
    ./fish
    ./zsh
    ./clangd-format
    ./tmux
  ];

  fonts.fontconfig.enable = true;

  home.sessionVariables = { EDITOR = "nvim"; };

  home.file.".config/snippets".source = ./snippets;

  programs = {
    git = {
      enable = true;
      userName = "cringulya";
      userEmail = "s0sis0n@yandex.ru";
    };

    zoxide = {
      enable = true;
      enableZshIntegration = true;
      enableFishIntegration = true;
    };
  };

  nixpkgs = {
    config = {
      allowUnfree = true;
      allowUnfreePredicate = _: true;
    };
  };
}
