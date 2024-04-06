{
  wayland.windowManager.hyprland.settings = {
    workspace = [
      "1, monitor:HDMI-A-1, default:true"
      "2, monitor:HDMI-A-1, default:false"
      "3, monitor:HDMI-A-1, default:false"
      "4, monitor:DP-2, default:true"
      "5, monitor:DP-2, default:false"
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

      "opacity 0.90 0.90,class:^(firefox)$"
      "opacity 0.80 0.80,class:^(org.telegram.desktop)$"
      "opacity 0.80 0.80,class:^(Brave-browser-nightly)$"
      "opacity 0.80 0.80,class:^(Steam)$"
      "opacity 0.80 0.80,class:^(steam)$"
      "opacity 0.80 0.80,class:^(org.pwmt.zathura)$"
      "opacity 0.80 0.80,class:^(steamwebhelper)$"
      "opacity 0.80 0.80,class:^(Spotify Premium)$"
      "opacity 0.80 0.80,class:^(Code)$"
      "opacity 0.80 0.80,class:^(code-url-handler)$"
      "opacity 0.80 0.80,class:^(kitty)$"
      "opacity 0.80 0.80,class:^(org.kde.dolphin)$"
      "opacity 0.80 0.80,class:^(org.kde.ark)$"
      "opacity 0.80 0.80,class:^(nwg-look)$"
      "opacity 0.80 0.80,class:^(qt5ct)$"

      "opacity 0.90 0.90,class:^(com.github.rafostar.Clapper)$ #Clapper-Gtk"
      "opacity 0.80 0.80,class:^(com.github.tchx84.Flatseal)$ #Flatseal-Gtk"
      "opacity 0.80 0.80,class:^(hu.kramo.Cartridges)$ #Cartridges-Gtk"
      "opacity 0.80 0.80,class:^(com.obsproject.Studio)$ #Obs-Qt"
      "opacity 0.80 0.80,class:^(gnome-boxes)$ #Boxes-Gtk"
      "opacity 0.80 0.80,class:^(discord)$ #Discord-Electron"
      "opacity 0.80 0.80,class:^(vesktop)$"
      "opacity 0.80 0.80,class:^(WebCord)$ #WebCord-Electron"
      "opacity 0.80 0.80,class:^(app.drey.Warp)$ #Warp-Gtk"
      "opacity 0.80 0.80,class:^(net.davidotek.pupgui2)$ #ProtonUp-Qt"
      "opacity 0.80 0.80,class:^(yad)$ #Protontricks-Gtk"
      "opacity 0.80 0.80,class:^(Signal)$ #Signal-Gtk"
      "opacity 0.80 0.80,class:^(io.gitlab.theevilskeleton.Upscaler)$ #Upscaler-Gtk"

      "opacity 0.80 0.70,class:^(pavucontrol)$"
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
      "float,class:^(pavucontrol)$"
      "float,class:^(blueman-manager)$"
      "float,class:^(nm-applet)$"
      "float,class:^(nm-connection-editor)$"
      "float,class:^(org.kde.polkit-kde-authentication-agent-1)$"

      "animation popin,class:^(kitty)$,title:^(update-sys)$"

      "workspace 2, class:^(firefox)$"
      "nodim,class:^(firefox)$"
      "workspace 2, class:^(Brave-browser-nightly)$"
      "nodim,class:^(firefox)$"
      "nodim,class:^(WebCord)$ #WebCord-Electron"
      "monitor 1,class:^(WebCord)$ #WebCord-Electron"
      "workspace 5, class:^(Spotify Premium)$"


      "workspace 5,class:^(org.telegram.desktop)$"
      "monitor 1,class:^(org.telegram.desktop)$"
      # windowrulev2 = float, class:^(org.telegram.desktop)$
      "size 30% 80%,class:^(org.telegram.desktop)$"
      "move 10% 10%,class:^(org.telegram.desktop)$"

      "fullscreen,title:(Media viewer)"
    ];
  };
}
