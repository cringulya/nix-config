{ pkgs, ... }:
{
  programs.ghostty = {
    enable = false;
    enableFishIntegration = true;
    settings = {
      theme = "lovelace";
      font-size = 20;
      confirm-close-surface = false;
      keybind = [
        "performable:ctrl+c=copy_to_clipboard"
        "ctrl+v=paste_from_clipboard"
      ];
    };
  };
}
