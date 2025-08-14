{ pkgs, ... }:

{
  programs.ssh = {
    enable = true;
    matchBlocks = {
      "office" = {
        hostname = "10.78.14.159";
        user = "ai.son";
      };
    };
  };
}
