{ pkgs, ... }:

{
  home.packages = with pkgs; [
    neomutt # Email client
    abook # Address book
    lynx # HTML viewer
    msmtp # SMTP client
    notmuch # Optional: email indexer
    pass
  ];

  programs.mbsync.enable = true;
  programs.msmtp.enable = true;
  programs.notmuch = {
    enable = true;
    hooks = {
      preNew = "mbsync --all";
    };
  };

  accounts.email = {
    accounts.sonartem = {
      address = "sonartem@icloud.com";
      mbsync = {
        enable = true;
        create = "maildir";
      };
      gpg = {
        key = "FB14FCD94B9FF40062727ED60C4353EFAEE9FB9E";
        signByDefault = true;
      };
      msmtp.enable = true;
      notmuch.enable = true;
      primary = true;
      realName = "Artem Son";
      signature = {
        text = ''
          Son Artem
        '';
        showSignature = "append";
      };
      passwordCommand = "pass show sonartem@icloud.com";
      userName = "sonartem@icloud.com";
      imap.host = "imap.mail.me.com";
      smtp = {
        host = "smtp.mail.me.com";
      };
      neomutt = {
        enable = true;
      };
    };
  };

  programs.neomutt = {
    enable = true;
    extraConfig = ''
      # vim: filetype=neomuttrc
      # This file contains all of mutt-wizard's default settings.
      # mutt-wizard will have this file sourced from your muttrc.
      # In the interest of seamless updating, do not edit this file.
      # If you want to override any settings, set those in your muttrc.
      set abort_key = "<Esc>"
      set send_charset="us-ascii:utf-8"
      set mailcap_path = $HOME/.config/mutt/mailcap:/usr/local/share/mutt-wizard/mailcap:$mailcap_path
      set mime_type_query_command = "file --mime-type -b %s"
      set date_format="%y/%m/%d %I:%M%p"
      set index_format="%2C %Z %?X?A& ? %D %-15.15F %s (%-4.4c)"
      set sort = 'reverse-date'
      set smtp_authenticators = 'gssapi:login'
      set query_command = "abook --mutt-query '%s'"
      set rfc2047_parameters = yes
      set sleep_time = 0		# Pause 0 seconds for informational messages
      set markers = no		# Disables the `+` displayed at line wraps
      set mark_old = no		# Unread mail stay unread until read
      set mime_forward = no	# mail body is forwarded as text
      set forward_attachments = yes	# attachments are forwarded with mail
      set wait_key = no		# mutt won't ask "press key to continue"
      set fast_reply			# skip to compose when replying
      set fcc_attach			# save attachments with the body
      set forward_format = "Fwd: %s"	# format of subject when forwarding
      set forward_quote		# include message in forwards
      set reverse_name		# reply as whomever it was to
      set include			# include message in replies
      set mail_check=60 # to avoid lags using IMAP with some email providers (yahoo for example)
      auto_view text/html		# automatically show html (mailcap uses lynx)
      auto_view application/pgp-encrypted
      #set display_filter = "tac | sed '/\\\[-- Autoview/,+1d' | tac" # Suppress autoview messages.
      alternative_order text/plain text/enriched text/html

      bind index,pager i noop
      bind index,pager g noop
      bind index \Cf noop
      bind index dT noop
      bind index,pager M noop
      bind index,pager gT noop
      bind index,pager C noop

      # General rebindings
      bind index gg first-entry
      bind index j next-entry
      bind index k previous-entry
      bind attach <return> view-mailcap
      bind attach l view-mailcap
      bind editor <space> noop
      bind index G last-entry
      bind pager,attach h exit
      bind pager j next-line
      bind pager k previous-line
      bind pager l view-attachments
      bind index D delete-message
      bind index U undelete-message
      bind index L limit
      bind index h noop
      bind index l display-message
      bind index,query <space> tag-entry
      #bind browser h goto-parent
      macro browser h '<change-dir><kill-line>..<enter>' "Go to parent folder"
      bind index,pager H view-raw-message
      bind browser l select-entry
      bind browser gg top-page
      bind browser G bottom-page
      bind pager gg top
      bind pager G bottom
      bind index,pager,browser d half-down
      bind index,pager,browser u half-up
      bind index,pager S sync-mailbox
      bind index,pager R group-reply
      bind index \031 previous-undeleted	# Mouse wheel
      bind index \005 next-undeleted		# Mouse wheel
      bind pager \031 previous-line		# Mouse wheel
      bind pager \005 next-line		# Mouse wheel
      bind editor <Tab> complete-query

      macro index,pager gi "<change-folder>=Inbox<enter>" "go to inbox"
      macro index,pager Mi ";<save-message>=Inbox<enter>" "move mail to inbox"
      macro index,pager Ci ";<copy-message>=Inbox<enter>" "copy mail to inbox"
      macro index,pager gd "<change-folder>=Drafts<enter>" "go to drafts"
      macro index,pager Md ";<save-message>=Drafts<enter>" "move mail to drafts"
      macro index,pager Cd ";<copy-message>=Drafts<enter>" "copy mail to drafts"
      macro index,pager gj "<change-folder>=Junk<enter>" "go to junk"
      macro index,pager Mj ";<save-message>=Junk<enter>" "move mail to junk"
      macro index,pager Cj ";<copy-message>=Junk<enter>" "copy mail to junk"
      macro index,pager gt "<change-folder>=Trash<enter>" "go to trash"
      macro index,pager Mt ";<save-message>=Trash<enter>" "move mail to trash"
      macro index,pager Ct ";<copy-message>=Trash<enter>" "copy mail to trash"
      macro index,pager gs "<change-folder>=Sent<enter>" "go to sent"
      macro index,pager Ms ";<save-message>=Sent<enter>" "move mail to sent"
      macro index,pager Cs ";<copy-message>=Sent<enter>" "copy mail to sent"
      macro index,pager ga "<change-folder>=Archive<enter>" "go to archive"
      macro index,pager Ma ";<save-message>=Archive<enter>" "move mail to archive"
      macro index,pager Ca ";<copy-message>=Archive<enter>" "copy mail to archive"

      #set crypt_auto_sign = yes
      #set crypt_opportunistic_encrypt = yes
      #set pgp_self_encrypt = yes
      #set pgp_default_key  = 'your@gpgemailaddre.ss'
      macro index \eg "<enter-command>unset wait_key<enter><shell-escape>gpg --list-secret-keys; printf 'Enter email ID of user to publish: '; read eID; printf 'Enter fingerprint of GPG key to publish: '; read eFGPT; $prefix/libexec/gpg-wks-client --create \\\$eFGPT \\\$eID | msmtp --read-envelope-from --read-recipients -a $fulladdr<enter>"  "publish GPG key to WKS provider"
      macro index \eh "<pipe-message>$prefix/libexec/gpg-wks-client --receive | msmtp --read-envelope-from --read-recipients -a $fulladdr<enter>" "confirm GPG publication"

      macro index,pager a "<enter-command>set my_pipe_decode=\$pipe_decode pipe_decode<return><pipe-message>abook --add-email<return><enter-command>set pipe_decode=\$my_pipe_decode; unset my_pipe_decode<return>" "add the sender address to abook"
      macro index \Cr "T~U<enter><tag-prefix><clear-flag>N<untag-pattern>.<enter>" "mark all messages as read"
      macro index A "<limit>all\n" "show all messages (undo limit)"

      # Sidebar mappings
      set sidebar_visible = no
      set sidebar_width = 20
      set sidebar_short_path = yes
      set sidebar_next_new_wrap = yes
      set mail_check_stats
      set sidebar_format = '%D%?F? [%F]?%* %?N?%N/? %?S?%S?'
      bind index,pager \Ck sidebar-prev
      bind index,pager \Cj sidebar-next
      bind index,pager \Co sidebar-open
      bind index,pager \Cp sidebar-prev-new
      bind index,pager \Cn sidebar-next-new
      bind index,pager B sidebar-toggle-visible

      # Default index colors:
      color index yellow default '.*'
      color index_author red default '.*'
      color index_number blue default
      color index_subject cyan default '.*'

      # New mail is boldened:
      color index brightyellow black "~N"
      color index_author brightred black "~N"
      color index_subject brightcyan black "~N"

      # Tagged mail is highlighted:
      color index brightyellow blue "~T"
      color index_author brightred blue "~T"
      color index_subject brightcyan blue "~T"

      # Flagged mail is highlighted:
      color index brightgreen default "~F"
      color index_subject brightgreen default "~F"
      color index_author brightgreen default "~F"

      # Other colors and aesthetic settings:
      mono bold bold
      mono underline underline
      mono indicator reverse
      mono error bold
      color normal default default
      color indicator brightblack white
      color sidebar_highlight red default
      color sidebar_divider brightblack black
      color sidebar_flagged red black
      color sidebar_new green black
      color error red default
      color tilde black default
      color message cyan default
      color markers red white
      color attachment white default
      color search brightmagenta default
      color status brightyellow black
      color hdrdefault brightgreen default
      color quoted green default
      color quoted1 blue default
      color quoted2 cyan default
      color quoted3 yellow default
      color quoted4 red default
      color quoted5 brightred default
      color signature brightgreen default
      color bold black default
      color underline black default

      # Regex highlighting:
      color header brightmagenta default "^From"
      color header brightcyan default "^Subject"
      color header brightwhite default "^(CC|BCC)"
      color header blue default ".*"
      color body brightred default "[\-\.+_a-zA-Z0-9]+@[\-\.a-zA-Z0-9]+" # Email addresses
      color body brightblue default "(https?|ftp)://[\-\.,/%~_:?&=\#a-zA-Z0-9]+" # URL
      color body green default "\`[^\`]*\`" # Green text between ` and `
      color body brightblue default "^# \.*" # Headings as bold blue
      color body brightcyan default "^## \.*" # Subheadings as bold cyan
      color body brightgreen default "^### \.*" # Subsubheadings as bold green
      color body yellow default "^(\t| )*(-|\\*) \.*" # List items as yellow
      color body brightcyan default "[;:][-o][)/(|]" # emoticons
      color body brightcyan default "[;:][)(|]" # emoticons
      color body brightcyan default "[ ][*][^*]*[*][ ]?" # more emoticon?
      color body brightcyan default "[ ]?[*][^*]*[*][ ]" # more emoticon?
      color body red default "(BAD signature)"
      color body cyan default "(Good signature)"
      color body brightblack default "^gpg: Good signature .*"
      color body brightyellow default "^gpg: "
      color body brightyellow red "^gpg: BAD signature from.*"
      mono body bold "^gpg: Good signature"
      mono body bold "^gpg: BAD signature from.*"
      color body red default "([a-z][a-z0-9+-]*://(((([a-z0-9_.!~*'();:&=+$,-]|%[0-9a-f][0-9a-f])*@)?((([a-z0-9]([a-z0-9-]*[a-z0-9])?)\\.)*([a-z]([a-z0-9-]*[a-z0-9])?)\\.?|[0-9]+\\.[0-9]+\\.[0-9]+\\.[0-9]+)(:[0-9]+)?)|([a-z0-9_.!~*'()$,;:@&=+-]|%[0-9a-f][0-9a-f])+)(/([a-z0-9_.!~*'():@&=+$,-]|%[0-9a-f][0-9a-f])*(;([a-z0-9_.!~*'():@&=+$,-]|%[0-9a-f][0-9a-f])*)*(/([a-z0-9_.!~*'():@&=+$,-]|%[0-9a-f][0-9a-f])*(;([a-z0-9_.!~*'():@&=+$,-]|%[0-9a-f][0-9a-f])*)*)*)?(\\?([a-z0-9_.!~*'();/?:@&=+$,-]|%[0-9a-f][0-9a-f])*)?(#([a-z0-9_.!~*'();/?:@&=+$,-]|%[0-9a-f][0-9a-f])*)?|(www|ftp)\\.(([a-z0-9]([a-z0-9-]*[a-z0-9])?)\\.)*([a-z]([a-z0-9-]*[a-z0-9])?)\\.?(:[0-9]+)?(/([-a-z0-9_.!~*'():@&=+$,]|%[0-9a-f][0-9a-f])*(;([-a-z0-9_.!~*'():@&=+$,]|%[0-9a-f][0-9a-f])*)*(/([-a-z0-9_.!~*'():@&=+$,]|%[0-9a-f][0-9a-f])*(;([-a-z0-9_.!~*'():@&=+$,]|%[0-9a-f][0-9a-f])*)*)*)?(\\?([-a-z0-9_.!~*'();/?:@&=+$,]|%[0-9a-f][0-9a-f])*)?(#([-a-z0-9_.!~*'();/?:@&=+$,]|%[0-9a-f][0-9a-f])*)?)[^].,:;!)? \t\r\n<>\"]"
    '';
  };

  home.file."./config/mutt/mailcap".text = ''
    text/plain; $EDITOR %s ;
    text/html; ${./openfile} %s ; nametemplate=%s.html
    text/html; lynx -assume_charset=%{charset} -display_charset=utf-8 -dump -width=1024 %s; nametemplate=%s.html; copiousoutput;
    image/*; ${./openfile} %s ;
    video/*; setsid mpv --quiet %s &; copiousoutput
    audio/*; mpv %s ;
    application/pdf; ${./openfile} %s ;
    application/pgp-encrypted; gpg -d '%s'; copiousoutput;
    application/pgp-keys; gpg --import '%s'; copiousoutput;
    application/x-subrip; $EDITOR %s ;
  '';
}
