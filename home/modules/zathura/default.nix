{
  programs.zathura = {
    enable = true;
    extraConfig = ''
      set selection-clipboard clipboard

      map f toggle_fullscreen
      map [fullscreen] f toggle_fullscreen

      # Open document in fit-width mode by default
      set adjust-open "best-fit"

      # One page per row by default
      set pages-per-row 1

      #stop at page boundries
      set scroll-page-aware "true"
      set scroll-full-overlap 0.01
      set scroll-step 50

      set font "Iosevka NFM 20"

      #zoom settings
      set zoom-min 10
      set guioptions ""
    '';
  };
}
