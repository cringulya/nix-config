{
  wayland.windowManager.hyprland.settings = {
    workspace = [
      "1, monitor:DP-5, default:true"
      "2, monitor:DP-5, default:false"
      "3, monitor:DP-5, default:false"
      "4, monitor:DP-7, default:true"
      "5, monitor:DP-7, default:false"
      "6, monitor:DP-7, default:false"
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

      "opacity 0.9 override 0.90 override,class:^(firefox)$"
      "opacity 0.90 override 0.90 override,class:^(org.telegram.desktop)$"
      "opacity 0.9 override 0.9 override, class:^(zen-alpha)$"
      "nodim, class:^(zen-alpha)$"

      "opacity 0.80 0.70,class:^(org.pulseaudio.pavucontrol)$"
      "opacity 0.80 0.70,class:^(blueman-manager)$"
      "opacity 0.80 0.70,class:^(nm-applet)$"
      "opacity 0.80 0.70,class:^(nm-connection-editor)$"
      "opacity 0.80 0.70,class:^(org.kde.polkit-kde-authentication-agent-1)$"

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
      "workspace 2, class:^(zen-alpha)$"
      "workspace 2, class:^(brave-browser)$"
      "nodim,class:^(firefox)$"

      "workspace 4,class:^(vesktop)$"
      "workspace 5, title:^(Spotify Premium)$"

      "workspace 6, class:^(org.telegram.desktop)$"
      "float, class:^(org.telegram.desktop)$"
      "size 30% 80%, class:^(org.telegram.desktop)$"
      "move 10% 10%, class:^(org.telegram.desktop)$"

      "fullscreen,title:(Media viewer)"
    ];
  };
}
