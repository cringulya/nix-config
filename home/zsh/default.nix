{ ... }:

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
      py = "python3";
      cd = "z";
    };

    initExtra = ''
      export CMAKE_C_COMPILER=clang
      export CMAKE_CXX_COMPILER=clang++
    '';
  };
}
