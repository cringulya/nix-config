{ pkgs, ... }:

{
  programs.tmux = {
    enable = true;
    shell = "${pkgs.fish}/bin/fish";
    plugins = with pkgs; [
      # {
      #   plugin = tmuxPlugins.catppuccin;
      #   extraConfig = ''
      #     set-option -g focus-events on
      #
      #
      #     # Make the status line more pleasant.
      #     set -g status-left ""
      #     set -g status-right '#[fg=#{@thm_crust},bg=#{@thm_teal}] session: #S '
      #
      #     # Ensure that everything on the right side of the status line
      #     # is included.
      #     set -g status-right-length 100
      #
      #     set -g @catppuccin_flavour 'mocha'
      #   '';
      # }

      {
        plugin = tmuxPlugins.resurrect;
        extraConfig = ''
          set -g @resurrect-strategy-vim 'session'
          set -g @resurrect-strategy-nvim 'session'
          set -g @resurrect-capture-pane-contents 'on'
        '';
      }

      {
        plugin = tmuxPlugins.continuum;
        extraConfig = ''
          set -g @continuum-restore 'on'
          set -g @continuum-boot 'on'
          set -g @continuum-save-interval '10'
        '';
      }

      # { plugin = tmuxPlugins.vim-tmux-navigator; }

    ];

    extraConfig = ''
      set -g default-terminal "screen-256color"
      set -s escape-time 0
      set -g prefix C-a
      unbind C-b
      bind-key C-b send-prefix
      set -gq allow-passthrough on
      set -g visual-activity off
      set -g base-index 1
      setw -g pane-base-index 1

      bind -r J resize-pane -D 3
      bind -r K resize-pane -U 3
      bind -r L resize-pane -R 3
      bind -r H resize-pane -L 3
      bind -r k select-pane -U
      bind -r j select-pane -D
      bind -r h select-pane -L
      bind -r l select-pane -R

      unbind m
      bind -r m resize-pane -Z
      set -g mouse on

      set-window-option -g mode-keys vi
      bind-key -T copy-mode-vi 'v' send -X begin-selection # start selecting text with "v"
      bind-key -T copy-mode-vi 'y' send -X copy-selection # copy text with "y"

    '';
  };
}
