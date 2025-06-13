let
  custom = {
    font = "JetBrainsMono";
    font_size = "15px";
    font_weight = "normal";
    primary = "#cdd6f4";
    third = "#89b4fa";
    forth = "#f5f5f5";
    button_empty = "#6c7086";
    secondary = "#b4befe";
    background = "#11111B";
    opacity = "0.98";
    btn_rad = "10px";
    btn_active_rad = "10px";
    x_mgn = "2px";
    y_mgn = "2px";
    x_hvr_mgn = "3px";
    y_hvr_mgn = "3px";
  };
in
{
  programs.wlogout.style = ''
        * {
        background-image: none;
        font-size: ${custom.font_size}px;
    }

    window {
        background-color: ${custom.background};
    }

    button {
        color: ${custom.primary};
        background-color: ${custom.background}
        outline-style: none;
        border: none;
        border-width: 0px;
        background-repeat: no-repeat;
        background-position: center;
        background-size: 10%;
        border-radius: 0px;
        box-shadow: none;
        text-shadow: none;
        animation: gradient_f 20s ease-in infinite;
    }

    button:focus {
        background-color: ${custom.secondary};
        background-size: 20%;
    }

    button:hover {
        background-color: @wb-hvr-bg;
        background-size: 25%;
        border-radius: ${custom.btn_active_rad};
        animation: gradient_f 20s ease-in infinite;
        transition: all 0.3s cubic-bezier(.55,0.0,.28,1.682);
    }

    button:hover#lock {
        border-radius: ${custom.btn_active_rad} ${custom.btn_active_rad} 0px ${custom.btn_active_rad};
        margin : ${custom.y_hvr_mgn}px 0px 0px ${custom.x_hvr_mgn}px;
    }

    button:hover#logout {
        border-radius: ${custom.btn_active_rad} 0px ${custom.btn_active_rad} ${custom.btn_active_rad};
        margin : 0px 0px ${custom.y_hvr_mgn} ${custom.x_hvr_mgn};
    }

    button:hover#shutdown {
        border-radius: ${custom.btn_active_rad} ${custom.btn_active_rad} ${custom.btn_active_rad} 0px;
        margin : ${custom.y_hvr_mgn} ${custom.x_hvr_mgn}0px 0px;
    }

    button:hover#reboot {
        border-radius: 0px ${custom.btn_active_rad} ${custom.btn_active_rad} ${custom.btn_active_rad};
        margin : 0px ${custom.x_hvr_mgn} ${custom.y_hvr_mgn} 0px;
    }

    #lock {
        border-radius: ${custom.btn_rad} 0px 0px 0px;
        margin : ${custom.y_mgn} 0px 0px ${custom.x_mgn};
    }

    #logout {
        border-radius: 0px 0px 0px ${custom.btn_rad};
        margin : 0px 0px ${custom.y_mgn} ${custom.x_mgn};
    }

    #shutdown {
        border-radius: 0px ${custom.btn_rad} 0px 0px;
        margin : ${custom.y_mgn} ${custom.x_mgn} 0px 0px;
    }

    #reboot {
        border-radius: 0px 0px ${custom.btn_rad} 0px;
        margin : 0px ${custom.x_mgn} ${custom.y_mgn} 0px;
    }
  '';
}
