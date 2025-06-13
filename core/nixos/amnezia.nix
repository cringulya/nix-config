{ pkgs, config, ... }:

{
  environment.systemPackages = with pkgs; [
    linuxKernel.packages.linux_6_12.amneziawg
    amneziawg-go
    amneziawg-tools
  ];

  boot.extraModulePackages = with config.boot.kernelPackages ; [ amneziawg ];
}
