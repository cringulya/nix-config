let
  custom = {
    font = "JetBrainsMono";
    font_size = "15px";
    font_weight = "normal";
    text_color = "#cdd6f4";
    secondary_accent = "#89b4fa";
    tertiary_accent = "#f5f5f5";
    button_empty = "#6c7086";
    button_active = "#b4befe";
    background = "#11111B";
    opacity = "0.98";
  };
in
{
  programs.waybar.style = ''

    * {
        border: none;
        border-radius: 0px;
        padding: 0;
        margin: 0;
        min-height: 0px;
        font-family: ${custom.font};
        font-weight: ${custom.font_weight};
        opacity: ${custom.opacity};
    }

    window#waybar {
        background: none;
    }

    #workspaces button {
      box-shadow: none;
      text-shadow: none;
      padding: 0px;
      border-radius: 12px;
      margin-top: 4px;
      margin-bottom: 4px;
      padding-left: 4px;
      padding-right: 4px;
      color: ${custom.button_empty};
      animation: gradient_f 20s ease-in infinite;
      transition: all 0.5s cubic-bezier(0.55, -0.68, 0.48, 1.682);
    }

    #workspaces button.active {
    background: ${custom.background};
      color: ${custom.button_active};
      margin-left: 4px;
      padding-left: 16px;
      padding-right: 16px;
      margin-right: 4px;
      animation: gradient_f 20s ease-in infinite;
      transition: all 0.3s cubic-bezier(0.55, -0.68, 0.48, 1.682);
    }

    #workspaces button:hover {
      background: ${custom.background};
      color: @wb-hvr-fg;
      padding-left: 4px;
      padding-right: 4px;
      animation: gradient_f 20s ease-in infinite;
      transition: all 0.3s cubic-bezier(0.55, -0.68, 0.48, 1.682);
    }

    #tray, #pulseaudio, #network, #cpu, #memory, #disk, #clock {
        font-size: ${custom.font_size};
        color: ${custom.text_color};
    }

    #cpu {
        padding-left: 15px;
        padding-right: 9px;
        margin-left: 7px;
    }
    #memory {
        padding-left: 9px;
        padding-right: 9px;
    }
    #disk {
        padding-left: 9px;
        padding-right: 15px;
    }

    #tray {
        padding: 0 20px;
        margin-left: 7px;
    }

    #pulseaudio {
        padding-left: 15px;
        padding-right: 9px;
        margin-left: 7px;
    }
    #network {
        padding-left: 9px;
        padding-right: 15px;
    }
    
    #clock {
        padding-left: 9px;
        padding-right: 15px;
    }

    #custom-launcher {
        font-size: 20px;
        color: #b4befe;
        font-weight: ${custom.font_weight};
        padding-left: 10px;
        padding-right: 15px;
    }
  '';
}
