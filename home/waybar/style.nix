{ config, ... }:
let
  custom = {
    font = "JetBrainsMono";
    font_size = "15px";
    font_weight = "normal";
    primary = "#${config.lib.stylix.colors.base05}";
    secondary = "#${config.lib.stylix.colors.base04}";
    background = "#${config.lib.stylix.colors.base00}";
    opacity = "0.8";
  };
in {
  stylix.targets.waybar.enable = false;
  programs.waybar.style = ''

    * {
        border: none;
        border-radius: 0px;
        padding: 0;
        margin: 0;
        min-height: 0px;
        font-family: ${custom.font};
        font-weight: ${custom.font_weight};
    }

    window#waybar {
        background: none;
    }

    #workspaces {
      padding-left: 16px;
    }

    #workspaces button {
      box-shadow: none;
      text-shadow: none;
      padding: 0px;
      border-radius: 5px;
      margin-top: 4px;
      margin-bottom: 4px;
      padding-left: 4px;
      padding-right: 4px;
      color: ${custom.primary};
      animation: gradient_f 20s ease-in infinite;
      transition: all 0.3s cubic-bezier(0.55, -0.68, 0.48, 1.682);
    }

    #workspaces button.active {
      background: ${custom.primary};
      color: ${custom.background};
      margin-left: 4px;
      padding-left: 5px;
      padding-right: 5px;
      margin-right: 4px;
      opacity: ${custom.opacity};
      animation: gradient_f 20s ease-in infinite;
      transition: all 0.3s cubic-bezier(0.55, -0.68, 0.48, 1.682);
    }

    #workspaces button:hover {
      background: ${custom.secondary};
      color: ${custom.background};
      margin-left: 4px;
      padding-left: 6px;
      padding-right: 6px;
      margin-right: 8px;
      opacity: ${custom.opacity};
      animation: gradient_f 20s ease-in infinite;
      transition: all 0.3s cubic-bezier(0.55, -0.68, 0.48, 1.682);
    }

    #taskbar button {
      box-shadow: none;
      text-shadow: none;
      padding: 0px;
      border-radius: 12px;
      margin-top: 4px;
      margin-bottom: 4px;
      padding-left: 8px;
      padding-right: 4px;
      color: ${custom.primary};
      opacity: ${custom.opacity};
      animation: gradient_f 20s ease-in infinite;
      transition: all 0.3s cubic-bezier(0.55, -0.68, 0.48, 1.682);
    }

    #taskbar button.active {
      background: ${custom.primary};
      color: ${custom.background};
      margin-left: 8px;
      padding-left: 16px;
      padding-right: 16px;
      margin-right: 4px;
      animation: gradient_f 20s ease-in infinite;
      transition: all 0.3s cubic-bezier(0.55, -0.68, 0.48, 1.682);
    }

    #taskbar button:hover {
      background: ${custom.secondary};
      color: ${custom.background};
      margin-left: 8px;
      padding-left: 16px;
      padding-right: 16px;
      margin-right: 4px;
      animation: gradient_f 20s ease-in infinite;
      transition: all 0.3s cubic-bezier(0.55, -0.68, 0.48, 1.682);
    }

    #tray, #pulseaudio, #network, #cpu, #memory, #disk, #clock {
        font-size: ${custom.font_size};
        color: ${custom.primary};
    }

    #cpu {
        padding-left: 9px;
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
        color: ${custom.primary};
        font-weight: ${custom.font_weight};
        padding-left: 10px;
        padding-right: 15px;
    }
  '';
}
