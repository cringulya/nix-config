{ pkgs, ... }:

{
  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "23.11";
  programs.home-manager.enable = true;

  imports = [
    ./packages/common.nix
    ./zathura
    ./starship
    ./syncthing
    ./neomutt
    ./neovide
    ./emacs
    ./fish
    ./zsh
    ./clangd-format
    ./tmux
    ./kitty
    ./latexindent
  ];

  fonts.fontconfig.enable = true;

  home.sessionVariables = { EDITOR = "nvim"; };

  home.file.".config/snippets".source = ./snippets;

  stylix.targets.neovim.enable = false;

  programs = {
    git = {
      enable = true;
      userName = "Artem Son";
      userEmail = "s0sis0n@yandex.ru";
    };

    zoxide = {
      enable = true;
      enableZshIntegration = true;
      enableFishIntegration = true;
    };
  };
}
