{
  wayland.windowManager.hyprland.settings = {
    workspace = [
      "1, monitor:DP-5, default:true"
      "2, monitor:DP-5"
      "3, monitor:DP-5"
      "4, monitor:DP-5"
      "5, monitor:DP-5"
      "6, monitor:DP-7, default:true"
      "7, monitor:DP-7"
      "8, monitor:DP-7"
      "9, monitor:DP-7"
      "10, monitor:DP-7"
    ];

    windowrulev2 = [
      "float, title:^(Picture-in-Picture)$"
      "float, title:^(Picture in picture)$"
      "size 30% 30%, title:^(Picture-in-Picture)$"
      "size 30% 30%, title:^(Picture in picture)$"
      "move 69.9% 69.9%, title:^(Picture-in-Picture)$"
      "move 69.9% 69.9%, title:^(Picture in picture)$"
      "pin, title:^(Picture-in-Picture)$"
      "pin, title:^(Picture in picture)$"
      "nodim, title:^(Picture-in-Picture)$"
      "nodim, title:^(Picture in picture)$"

      "float,class:^(qt5ct)$"
      "float,class:^(nwg-look)$"
      "float,class:^(org.kde.ark)$"
      "float,class:^(Signal)$ #Signal-Gtk"
      "float,class:^(com.github.rafostar.Clapper)$ #Clapper-Gtk"
      "float,class:^(app.drey.Warp)$ #Warp-Gtk"
      "float,class:^(net.davidotek.pupgui2)$ #ProtonUp-Qt"
      "float,class:^(yad)$ #Protontricks-Gtk"
      "float,class:^(eog)$ #Imageviewer-Gtk"
      "float,class:^(io.gitlab.theevilskeleton.Upscaler)$ #Upscaler-Gtk"
      "float,class:^(org.pulseaudio.pavucontrol)$"
      "float,class:^(blueman-manager)$"
      "float,class:^(nm-applet)$"
      "float,class:^(nm-connection-editor)$"
      "float,class:^(org.kde.polkit-kde-authentication-agent-1)$"

      "animation popin,class:^(kitty)$,title:^(update-sys)$"

      "workspace 2, class:^(firefox)$"
      "workspace 2, initialTitle:^(Zen Browser)$"
      "workspace 2, class:^(google-chrome)$"
      "workspace 1, class:^(brave-browser)$"
      "nodim,class:^(firefox)$"

      "workspace 8, class:^(vesktop)$"
      "workspace 9, title:^(Spotify Premium)$"
      "workspace 10, class:^(org.telegram.desktop)$"

      "fullscreen,title:(Media viewer)"
    ];
  };
}
