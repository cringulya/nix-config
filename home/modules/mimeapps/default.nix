{ pkgs, ... }:

{
  xdg.mimeApps.enable = true;
  xdg.mimeApps.defaultApplications = {
    "x-scheme-handler/http" = "zen-beta.desktop";
    "x-scheme-handler/https" = "zen-beta.desktop";
    "text/html" = "zen-beta.desktop";
    "application/pdf" = "org.pwmt.zathura.desktop";
  };
}
