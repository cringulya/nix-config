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
    };
    theme = "Catppuccin-Mocha";

    font = {
      name = "Iosevka";
      package = pkgs.nerdfonts.override { fonts = [ "Iosevka" ]; };
    };
  };
}
