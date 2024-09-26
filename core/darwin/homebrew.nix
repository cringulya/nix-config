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
      "postgresql@16"
    ];

    casks = [ "telegram" "pgadmin4" ];
  };
}
