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
      {
        name = "postgresql@16";
        start_service = true;
      }
    ];

    casks = [ "telegram" "pgadmin4" ];
  };
}
