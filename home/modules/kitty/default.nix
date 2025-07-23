{ pkgs, ... }:

{
  programs.kitty = {
    enable = true;
    keybindings = {
      "ctrl+c" = "copy_and_clear_or_interrupt";
      "ctrl+v" = "paste_from_clipboard";
    };
    settings = {
      font_size = 18;
      hide_window_decorations = "titlebar-only";
      macos_quit_when_last_window_closed = true;
      cursor_trail = 10;
      cursor_trail_start_threshold = 0;
      cursor_trail_decay = "0.01 0.05";
      cursor_shape = "block";
      cursor_blink = true;
    };

    extraConfig = ''
      modify_font cell_height 110%
    '';

    darwinLaunchOptions = [ "--single-instance" ];
  };
}
