{
  imports = [
    ./packages.nix
    ./style.nix
    ./hyprland/default.nix
    ./fish/default.nix
    ./kitty/default.nix
    ./waybar/default.nix
    ./wofi/default.nix
    ./btop/default.nix
    ./mako/default.nix
  ];

  nixpkgs = {
    config = {
      allowUnfree = true;
      # Workaround for https://github.com/nix-community/home-manager/issues/2942
      allowUnfreePredicate = _: true;
    };
  };

  home.username = "artemson";
  home.homeDirectory = "/home/artemson";


  home.file = {
    ".clang-format".text = ''
      ---
      BasedOnStyle: LLVM

      ---
      Language: Cpp
      AlignAfterOpenBracket : BAS_Align
      AlignArrayOfStructures: AIAS_Right
      AllowShortFunctionsOnASingleLine: SFS_InlineOnly
    '';

  };


  home.sessionVariables = {
    EDITOR = "nvim";
  };

  programs = {
    git = {
      enable = true;
      userName = "p0pusk";
      userEmail = "s0sis0n@yandex.ru";
    };
  };


  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  systemd.user.startServices = "sd-switch";


  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "23.11";
}
