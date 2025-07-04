{ pkgs, config, ... }:

{
  home.packages = with pkgs; [
    abook # Address book
    lynx # HTML viewer
    msmtp # SMTP client
    notmuch # Optional: email indexer
    pass
  ];

  services.mbsync = {
    enable = true;
    postExec = "${pkgs.writeShellScript "mbsync-notify" ''
      NEW=$(find ~/Maildir -type f -path "*/new/*" | wc -l)
      if [ "$NEW" -gt 0 ]; then
        notify-send "📬 New Mail" "You have $NEW new messages"
      fi
    ''}";
  };
  programs.mbsync.enable = true;

  programs.msmtp.enable = true;
  programs.notmuch = {
    enable = true;
    hooks = {
      preNew = "mbsync -a";
    };
  };

  accounts.email.accounts = {
    sonartem = {
      address = "sonartem@icloud.com";
      userName = "sonartem@icloud.com";
      realName = "Artem Son";
      primary = true;
      passwordCommand = "pass sonartem@icloud.com";

      notmuch.enable = true;
      msmtp.enable = true;
      mbsync = {
        enable = true;
        create = "maildir";
      };
      imap = {
        host = "imap.mail.me.com";
        port = 993;
      };
      smtp = {
        host = "smtp.mail.me.com";
        port = 587;
        tls = {
          enable = true;
          useStartTls = true;
        };
      };
      folders = {
        sent = "Sent Messages";
      };
      aerc.enable = true;
    };

    s0sis0n = {
      address = "s0sis0n@yandex.ru";
      userName = "s0sis0n@yandex.ru";
      realName = "Artem Son";
      flavor = "yandex.com";
      passwordCommand = "pass show s0sis0n@yandex.ru";

      notmuch.enable = true;
      msmtp.enable = true;
      mbsync = {
        enable = true;
        create = "maildir";
      };
      aerc.enable = true;
    };

    gmail = {
      address = "just.me5550@gmail.com";
      userName = "just.me5550@gmail.com";
      realName = "Artem Son";
      flavor = "gmail.com";
      passwordCommand = "pass just.me5550@gmail.com";

      mbsync = {
        enable = true;
        create = "maildir";
      };
      notmuch.enable = true;
      msmtp.enable = true;
      aerc.enable = true;
    };
  };
}
