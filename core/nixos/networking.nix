{ pkgs, ... }:

{
  networking = {
    enableIPv6 = true;
    networkmanager = { enable = true; };
    nameservers = [ "1.1.1.1" ];
    resolvconf.dnsSingleRequest = true;
    enableStrongSwan = true;
    firewall = {
      enable = true;
      checkReversePath = false;
      allowedTCPPorts = [ 22 80 9993 51820 8080 443 1935 49152 8125 ];
      allowedUDPPorts = [ 22 80 9993 51820 8080 443 1935 49152 8125 ];
    };
  };

  programs.nm-applet.enable = true;

  boot.kernel.sysctl = {
    "net.ipv4.ip_forward" = 1;
    "net.ipv6.conf.all.forwarding" = 1;
  };

  services = {
    resolved = {
      enable = true;
      dnsovertls = "true";
    };
    dnscrypt-proxy2 = {
      enable = true;
      settings = {
        server_names = [ "cloudflare" "scaleway-fr" "google" ];
        listen_addresses = [ "127.0.0.1:53" "[::1]:53" ];
      };
    };
  };
}
