{ config, pkgs, ... }:

{
  stylix.targets.rofi.enable = false;

  home.packages = with pkgs;
    [
      jq # Required for rofi-systemd
    ];

  programs.rofi = {
    enable = true;
    cycle = true;
    location = "center";
    pass = { };
    plugins = [ pkgs.rofi-calc pkgs.rofi-emoji pkgs.rofi-systemd ];
    font = "Iosevka Nerd Font 18";
    theme =
      let inherit (config.lib.formats.rasi) mkLiteral;
      in {

        # Inspired by https://github.com/sherubthakur/dotfiles/blob/master/users/modules/desktop-environment/rofi/launcher.rasi

        "*" = {
          background-color = mkLiteral "#${config.lib.stylix.colors.base00}";
          foreground-color = mkLiteral "#${config.lib.stylix.colors.base05}";
          text-color = mkLiteral "#${config.lib.stylix.colors.base05}";
          border-color = mkLiteral "#${config.lib.stylix.colors.base0D}";
        };

        # Holds the entire window
        "#window" = {
          transparency = "real";
          background-color = mkLiteral "#${config.lib.stylix.colors.base00}";
          text-color = mkLiteral "#${config.lib.stylix.colors.base05}";
          border = mkLiteral "4px";
          border-color = mkLiteral "#${config.lib.stylix.colors.base0D}";
          border-radius = mkLiteral "4px";
          width = mkLiteral "850px";
          padding = mkLiteral "15px";
        };

        # Wrapper around bar and results
        "#mainbox" = {
          background-color = mkLiteral "#${config.lib.stylix.colors.base00}";
          border = mkLiteral "0px";
          border-radius = mkLiteral "0px";
          border-color = mkLiteral "#${config.lib.stylix.colors.base0D}";
          children = map mkLiteral [ "inputbar" "message" "listview" ];
          spacing = mkLiteral "10px";
          padding = mkLiteral "10px";
        };

        # Unknown
        "#textbox-prompt-colon" = {
          expand = false;
          str = ":";
          margin = mkLiteral "0px 0.3em 0em 0em";
          text-color = mkLiteral "#${config.lib.stylix.colors.base05}";
        };

        # Command prompt left of the input
        "#prompt" = { enabled = false; };

        # Actual text box
        "#entry" = {
          placeholder-color = mkLiteral "#${config.lib.stylix.colors.base0D}";
          expand = true;
          horizontal-align = "0";
          placeholder = "";
          padding = mkLiteral "0px 0px 0px 5px";
          blink = true;
        };

        # Top bar
        "#inputbar" = {
          children = map mkLiteral [ "prompt" "entry" ];
          border = mkLiteral "1px";
          border-radius = mkLiteral "4px";
          padding = mkLiteral "6px";
        };

        # Results
        "#listview" = {
          background-color = mkLiteral "#${config.lib.stylix.colors.base00}";
          padding = mkLiteral "0px";
          columns = 1;
          lines = 12;
          spacing = mkLiteral "5px";
          cycle = true;
          dynamic = true;
          layout = "vertical";
        };

        # Each result
        "#element" = {
          orientation = "vertical";
          border-radius = mkLiteral "0px";
          padding = mkLiteral "5px 0px 5px 5px";
        };

        "#element.selected" = {
          border = mkLiteral "1px";
          border-radius = mkLiteral "4px";
          border-color = mkLiteral "#${config.lib.stylix.colors.base05}";
          background-color = "#${config.lib.stylix.colors.base02}";
          text-color = "#${config.lib.stylix.colors.base05}";
        };

        "#element-text" = {
          expand = true;
          # horizontal-align = mkLiteral "0.5";
          vertical-align = mkLiteral "0.5";
          margin = mkLiteral "0px 2.5px 0px 2.5px";
        };
        "#element-text.selected" = {
          background-color = mkLiteral "#${config.lib.stylix.colors.base02}";
          text-color = mkLiteral "#${config.lib.stylix.colors.base05}";
        };

        # Not sure how to get icons
        "#element-icon" = {
          size = mkLiteral "18px";
          border = mkLiteral "0px";
          padding = mkLiteral "2px 5px 2px 2px";
          background-color = mkLiteral "#${config.lib.stylix.colors.base02}";
        };
        "#element-icon.selected" = {
          background-color = mkLiteral "#${config.lib.stylix.colors.base02}";
          text-color = mkLiteral "#${config.lib.stylix.colors.base02}";
        };
      };

    xoffset = 0;
    yoffset = -20;
    extraConfig = {
      show-icons = true;
      kb-cancel = "Escape,Super+space";
      modi = "window,run,ssh,emoji,calc,drun";
      sort = true;
      # levenshtein-sort = true;
    };
  };
}
