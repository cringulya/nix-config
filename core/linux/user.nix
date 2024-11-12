{ pkgs, inputs, ... }:

{
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.artemson = {
    isNormalUser = true;
    description = "Artem Son";
    extraGroups = [ "networkmanager" "wheel" "docker" ];
    shell = pkgs.zsh;
  };

  nix.settings.allowed-users = [ "artemson" ];
}
