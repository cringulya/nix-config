{ pkgs, ... }:

{
  networking = {
    enableIPv6 = true;
    networkmanager = {
      enable = true;
      plugins = [ pkgs.networkmanager-openvpn ];
    };
    nameservers = [ "10.76.4.153" ];
    search = [ "localdomain" ];
    resolvconf.dnsSingleRequest = true;
    firewall = {
      enable = false;
      checkReversePath = false;
      allowedTCPPorts = [ 22 80 9993 51820 8080 443 1935 49152 8125 ];
      allowedUDPPorts = [ 22 80 9993 51820 8080 443 1935 49152 8125 ];
    };
  };

  services = {
    resolved = {
      enable = true;
    };
    dnscrypt-proxy2 = {
      enable = false;
      settings = {
        server_names = [ "cloudflare" "scaleway-fr" "google" ];
        listen_addresses = [ "127.0.0.1:53" "[::1]:53" ];
      };
    };
  };
}
