{ hostname, stateVersion, ... }:
{
  imports = [
    ../../nixos/profiles/base-xfce.nix
    ./hardware-configuration.nix
    ./disks.nix
  ];

  networking.hostName = hostname;
  system.stateVersion = stateVersion;
}
