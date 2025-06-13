{
  services.zapret = {
    enable = true;

    udpSupport = true;
    udpPorts = [ "50000:65535" ];

    params = [
      "--dpi-desync=split2 --dpi-desync-ttl=5 --wssize 1:6 --dpi-desync-fooling=md5sig"
      "--dpi-desync=fake --dpi-desync-any-protocol --dpi-desync-repeats=6"
    ];
  };
}
