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
      "c++" = "clang++";
    };

    initExtra = ''
      export ESCDELAY=0
      export CXX=${pkgs.clang}/bin/clang++
    '';
  };
}
