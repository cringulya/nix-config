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
    };
    theme = "Catppuccin-Mocha";

    darwinLaunchOptions = [ "--single-instance" ];

    font = {
      name = "Iosevka Nerd Font Mono";
      package = pkgs.nerdfonts.override { fonts = [ "Iosevka" ]; };
    };
  };
}
