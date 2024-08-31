{ ... }:

{
  homebrew = {
    enable = true;
    onActivation = {
      cleanup = "zap";
      autoUpdate = true;
    };

    taps = [
    ];

    brews = [
    ];

    casks = [
      "telegram"
    ];
  };
}
