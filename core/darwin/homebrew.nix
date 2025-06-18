{
  homebrew = {
    enable = true;
    onActivation = {
      cleanup = "zap";
      autoUpdate = true;
    };

    taps = [ "homebrew/services" ];

    brews = [
      {
        name = "dbus";
        start_service = true;
      }
    ];

    casks = [ "telegram" "spotify" "zen" "hammerspoon" ];
  };
}
