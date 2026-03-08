{
  hostname,
  stateVersion,
  ...
}: {
  imports = [
    ../../nixos/profiles/workstation.nix
    ./hardware-configuration.nix
    ./disks.nix
  ];

  boot.kernelParams = [
    "amdgpu.dc=1"
    "video=HDMI-A-1:1920x1080@60"
    "video=DVI-D-1:1920x1080@60"
  ];
  boot.initrd.kernelModules = ["amdgpu"];
  services.xserver.videoDrivers = ["amdgpu"];
  services.dbus.implementation = "broker";

  networking.hostName = hostname;
  system.stateVersion = stateVersion;
}
