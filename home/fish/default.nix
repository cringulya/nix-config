{ pkgs, ... }:

{
  programs.fish = {
    enable = true;
    shellAliases = {
      vi = "nvim";
      py = "python3";
      cd = "z";
    };
    interactiveShellInit = ''
      ${pkgs.any-nix-shell}/bin/any-nix-shell fish --info-right | source
      set fish_greeting # Disable greeting
    '';
  };
}
