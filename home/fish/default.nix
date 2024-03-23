{
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set fish_greeting # Disable greeting
      alias vi="nvim"
      alias py="python3"
      alias nix-switch="sudo nixos-rebuild switch --flake ~/.config/nix#abobus"
      alias hms="home-manager --flake ~/.config/nix#artemson@abobus switch"
      starship init fish | source
      fish_add_path ~/.local/share/nvim/mason/bin/
    '';
  };
}
