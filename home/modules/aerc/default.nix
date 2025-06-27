{ pkgs, ... }:
{
  home.packages = with pkgs; [
    w3m
    fzf
    abook
    w3m
    catimg
  ];

  programs.aerc = {
    enable = true;
    extraConfig = {
      compose.address-book-cmd = ''
        sh -c "abook --mutt-query '%s' \
        | fzf --delimiter='\t' --with-nth=1,2 \
        | cut -f1"
      '';
      general.unsafe-accounts-conf = true;
      filters = {
        "text/plain" = "colorize";
        "text/calendar" = "calendar";
        "message/delivery-status" = "colorize";
        "message/rfc822" = "colorize";
        "#text/html" = "!html";
        "text/html" = "!w3m -T text/html -I UTF-8";
        "#text/*" = "bat -fP --file-name=\"$AERC_FILENAME\"";
        "#application/x-sh" = "bat -fP -l sh";
        "image/*" = "catimg -w $(tput cols) -";
      };

    };
  };
}
