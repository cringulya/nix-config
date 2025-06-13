{
  networking = {
    enableIPv6 = true;
    networkmanager = { enable = true; };
    nameservers = [ "1.1.1.1" ];
    resolvconf.dnsSingleRequest = true;
    firewall = {
      enable = true;
      allowedTCPPorts = [ 22 80 9993 51820 8080 443 1935 49152 8125 ];
      allowedUDPPorts = [ 22 80 9993 51820 8080 443 1935 49152 8125 ];
    };
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
