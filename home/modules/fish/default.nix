{ pkgs, ... }:

{
  programs.fish = {
    enable = true;
    shellAliases = {
      ls = "eza --icons --group-directories-first";
      ll = "ls -l";
      vi = "nvim";
      vif = "nvim $(fzf)";
      py = "python3";
      cd = "z";
      cat = "bat";
      nshell = "nix-shell --command fish";
    };
    interactiveShellInit = ''
      ${pkgs.any-nix-shell}/bin/any-nix-shell fish --info-right | source
      set fish_greeting # Disable greeting
    '';
    shellInit = ''
      export ESCDELAY=0
      export CC=clang
      export CXX=clang++
    '';
  };
}
