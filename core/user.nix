{ pkgs, inputs, ... }:

{
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = { inherit inputs; };
    users.artemson = import ../home/home.nix;
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.artemson = {
    isNormalUser = true;
    description = "Artem Son";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.fish;
  };

  nix.settings.allowed-users = [ "artemson" ];
}
