{ pkgs, ... }:

{
  stylix.enable = true;
  stylix.image = "${../../wallpapers/hyprchan.png}";
  stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/tokyo-night-dark.yaml";

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
  };

  stylix.polarity = "dark";
}
