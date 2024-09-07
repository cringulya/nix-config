{ pkgs, ... }:

{
  catppuccin.flavor = "mocha";
  catppuccin.accent = "lavender";

  gtk.catppuccin = {
    enable = true;
    size = "compact";
  };

  qt = {
    enable = true;
    style.name = "kvantum";
    platformTheme.name = "kvantum";
    style.catppuccin.enable = true;
  };

  fonts.fontconfig.enable = true;

  home.packages = [
    (pkgs.nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
    pkgs.twemoji-color-font
    pkgs.noto-fonts-emoji
  ];

  gtk = {
    enable = true;
    gtk3.extraConfig.gtk-application-prefer-dark-theme = 1;

    font = {
      name = "JetBrainsMono Nerd Font";
      size = 11;
    };
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.catppuccin-papirus-folders.override {
        flavor = "mocha";
        accent = "lavender";
      };
    };
    cursorTheme = {
      name = "GoogleDot-Blue";
      package = pkgs.google-cursor;
      size = 22;
    };
  };

  home.pointerCursor = {
    name = "GoogleDot-Blue";
    package = pkgs.google-cursor;
    size = 22;
  };
}
