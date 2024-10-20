{ pkgs, ... }:

{
  stylix.enable = true;
  stylix.image = "${../../wallpapers/military.jpeg}";
  stylix.base16Scheme =
    "${pkgs.base16-schemes}/share/themes/rose-pine-moon.yaml";

  stylix.cursor = {
    package = pkgs.google-cursor;
    name = "GoogleDot-Blue";
    size = 22;
  };

  stylix.fonts = {
    # packages = [ pkgs.twemoji-color-font pkgs.noto-fonts-emoji ];
    monospace = {
      name = "Iosevka Nerd Font Mono";
      package = pkgs.nerdfonts.override { fonts = [ "Iosevka" ]; };
    };
    sansSerif = {
      name = "JetBrainsMono";
      package = pkgs.nerdfonts.override { fonts = [ "JetBrainsMono" ]; };
    };
    serif = {
      name = "JetBrainsMono";
      package = pkgs.nerdfonts.override { fonts = [ "JetBrainsMono" ]; };
    };
  };

  stylix.polarity = "dark";
}
