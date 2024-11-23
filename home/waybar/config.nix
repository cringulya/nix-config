{
  programs.waybar.settings.mainBar = {
    position = "top";
    layer = "top";
    height = 5;
    margin-top = 0;
    margin-bottom = 0;
    margin-left = 0;
    margin-right = 0;
    modules-left = [ "custom/launcher" "hyprland/workspaces" "wlr/taskbar" ];
    modules-center = [ "clock" ];
    modules-right = [
      "tray"
      "cpu"
      "memory"
      "disk"
      "hyprland/language"
      "pulseaudio"
      "network"
    ];
    clock = {
      format = "  {:%H:%M}";
      tooltip = "true";
      tooltip-format = ''
        <big>{:%Y %B}</big>
        <tt><small>{calendar}</small></tt>'';
      format-alt = "  {:%d.%m}";
    };
    "hyprland/workspaces" = {
      active-only = false;
      disable-scroll = true;
      all_inputs = true;
      # format = "{icon}";
      on-click = "activate";
      format-icons = {
        urgent = "";
        default = "";
        sort-by-number = true;
      };
      # persistent-workspaces = { "1" = [ ]; };
    };
    "wlr/taskbar" = {
      format = "{icon}";
      icon-size = 24;
      spacing = 8;
      # icon-theme = "Papirus-Dark";
      tooltip-format = "{title}";
      on-click = "activate";
      on-click-middle = "close";
      ignore-list = [ "kitty" ];
    };
    memory = {
      format = "󰟜 {}%";
      format-alt = "󰟜 {used} GiB"; # 
      interval = 2;
    };
    cpu = {
      format = "  {usage}%";
      format-alt = "  {avg_frequency} GHz";
      interval = 2;
    };
    disk = {
      path = "/";
      format = "󰋊 {percentage_used}%";
      interval = 60;
    };
    network = {
      format-wifi = "  {signalStrength}%";
      format-ethernet = "󰀂 ";
      tooltip-format = "Connected to {essid} {ifname} via {gwaddr}";
      format-linked = "{ifname} (No IP)";
      format-disconnected = "󰖪 ";
    };
    tray = {
      icon-size = 24;
      spacing = 8;
    };
    pulseaudio = {
      format = "{icon} {volume}%";
      format-muted = "󰖁 ";
      format-icons = { default = [ " " ]; };
      scroll-step = 1;
      on-click = "pavucontrol -t 3";
    };
    "hyprland/language" = {
      format = "{}";
      format-en = "🇺🇸";
      format-ru = "🇷🇺";
      keyboard-name = "keychron-keychron-q1-keyboard";
    };
    "custom/launcher" = {
      format = "";
      on-click = "pkill wofi || wofi --show drun";
      on-click-right = "pkill wofi || wallpaper-picker";
      tooltip = "false";
    };
  };
}
