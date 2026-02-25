{ hostname, stateVersion, ... }:
{
  imports = [
    ../../nixos/profiles/workstation.nix
    ./hardware-configuration.nix
    ./disks.nix
  ];

  networking.hostName = hostname;
  system.stateVersion = stateVersion;
}
