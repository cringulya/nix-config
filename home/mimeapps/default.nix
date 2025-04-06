{ pkgs, ... }:

{
  home.file.".config/mimeapps.list".text =
    ''
      application/pdf=org.pwmt.zathura.desktop
    '';
}
