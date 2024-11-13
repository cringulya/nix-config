{ pkgs, ... }:

{
  home.file.".config/mimeapps.list".text = let browser = "firefox";
  in ''
    [Default Applications]
    x-scheme-handler/http=${browser}
    x-scheme-handler/https=${browser}
    x-scheme-handler/chrome=${browser}
    text/html=${browser}
    application/x-extension-htm=${browser}
    application/x-extension-html=${browser}
    application/x-extension-shtml=${browser}
    application/xhtml+xml=${browser}
    application/x-extension-xhtml=${browser}
    application/x-extension-xht=${browser}
    application/pdf=org.pwmt.zathura.desktop


    [Added Associations]
    x-scheme-handler/http=${browser}
    x-scheme-handler/https=${browser}
    x-scheme-handler/chrome=${browser}
    text/html=${browser}
    application/x-extension-htm=${browser}
    application/x-extension-html=${browser}
    application/x-extension-shtml=${browser}
    application/xhtml+xml=${browser}
    application/x-extension-xhtml=${browser}
    application/x-extension-xht=${browser}
    application/pdf=org.pwmt.zathura.desktop
  '';
}
