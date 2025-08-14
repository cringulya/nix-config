{ pkgs, ... }:

{
  programs.fish = {
    enable = true;
    shellAliases = {
      ls = "eza --icons --group-directories-first";
      ll = "ls -l";
      vi = "nvim";
      py = "python3";
      cd = "z";
      cat = "bat";
      nshell = "nix-shell --command fish";
      vpn-office = "openvpn3 session-start --config ~/docs/tensor_dev_yar.ovpn && openvpn3 session-auth";
      vpn-office-disconnect = "openvpn3 session-manage -c ~/docs/tensor_dev_yar.ovpn -D";
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
