{
  services.zapret = {
    enable = true;

    udpSupport = true;
    udpPorts = [ "50000:65535" ];

    params = [
      "--filter-udp=443 --hostlist=\"${../../utils/list-discord.txt}\" --dpi-desync=fake --dpi-desync-repeats=6 --dpi-desync-fake-quic=\"${../../utils/quic_initial_www_google_com.bin}\" --new ^"
      "--filter-udp=50000-50100 --ipset=\"${../../utils/ipset-discord.txt}\" --dpi-desync=fake --dpi-desync-any-protocol --dpi-desync-cutoff=d3 --dpi-desync-repeats=6 --new ^"
      "--filter-tcp=443 --hostlist=\"${../../utils/list-discord.txt}\" --dpi-desync=fake,split --dpi-desync-autottl=2 --dpi-desync-repeats=6 --dpi-desync-fooling=badseq --dpi-desync-fake-tls=\"${../../utils/tls_clienthello_www_google_com.bin}\""
    ];
  };
}
