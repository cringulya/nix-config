{ pkgs, ... }:

{
  xdg.mimeApps.enable = true;
  xdg.mimeApps.defaultApplications = {
    "x-scheme-handler/http" = "userapp-Twilight-HPII82.desktop";
    "x-scheme-handler/https" = "userapp-Twilight-HPII82.desktop";
    "text/html" = "userapp-Twilight-HPII82.desktop";
    "application/pdf" = "org.pwmt.zathura.desktop";
    "x-scheme-handler/tg" = "org.telegram.desktop.desktop";
    "x-scheme-handler/tonsite" = "org.telegram.desktop.desktop";
  };
}
