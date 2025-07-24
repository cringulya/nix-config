{ pkgs, config, ... }:

{
  home.packages = with pkgs; [
    abook # Address book
    lynx # HTML viewer
    notmuch # Optional: email indexer
    isync
    pass
  ];

  programs.msmtp.enable = true;
  programs.mbsync.enable = true;
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
