{ pkgs, ... }:

let
  browser = "userapp-Twilight-VCQS92.desktop";
in
{
  xdg.mimeApps.enable = true;
  xdg.mimeApps.defaultApplications = {
    "x-scheme-handler/http" = browser;
    "x-scheme-handler/https" = browser;
    "text/html" = browser;
    "application/pdf" = "org.pwmt.zathura.desktop";
    "x-scheme-handler/tg" = "org.telegram.desktop.desktop";
    "x-scheme-handler/tonsite" = "org.telegram.desktop.desktop";
  };
}
