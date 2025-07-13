{ pkgs, ... }:

{
  stylix.enable = true;
  stylix.image = "${../../wallpapers/drawing.jpg}";
  stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/tokyo-night-dark.yaml";
  # stylix.base16Scheme = "${./themes/blueberry.yaml}";

  stylix.cursor = {
    package = pkgs.google-cursor;
    name = "GoogleDot-Blue";
    size = 22;
  };

  stylix.fonts = {
    # packages = [ pkgs.twemoji-color-font pkgs.noto-fonts-emoji ];
    monospace = {
      name = "Iosevka Nerd Font Mono";
      package = pkgs.nerd-fonts.iosevka;
    };
    sansSerif = {
      name = "JetBrainsMono";
      package = pkgs.nerd-fonts.jetbrains-mono;
    };
    serif = {
      name = "JetBrainsMono";
      package = pkgs.nerd-fonts.jetbrains-mono;
    };
    sizes = { terminal = 18; };
  };

  stylix.polarity = "dark";

  stylix.targets = {
    chromium.enable = false;
  };
}
