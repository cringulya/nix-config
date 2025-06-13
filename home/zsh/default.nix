{ pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    defaultKeymap = "emacs";

    shellAliases = {
      ll = "ls -l";
      vi = "nvim";
      vif = "nvim $(fzf)";
      py = "python3";
      cd = "z";
      nshell = "nix-shell --command zsh";
    };

    initContent = ''
      export ESCDELAY=0
      export CC=clang
      export CXX=clang++
    '';
  };
}
