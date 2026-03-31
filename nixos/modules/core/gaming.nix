{pkgs, ...}: {
  boot.kernelModules = ["xpad"];

  hardware = {
    # Graphics settings
    graphics = {
      enable = true;
      enable32Bit = true;
    };
    # Controller support (XInput & DualShock/DualSense)
    xpadneo.enable = false;
    steam-hardware.enable = true;
  };

  # Extra udev rules for various game controllers
  services.udev.packages = [pkgs.game-devices-udev-rules];

  programs = {
    # Steam configuration
    steam = {
      enable = true;
      dedicatedServer.openFirewall = true;
      gamescopeSession.enable = true;
    };
    # Optimization system for games
    gamemode.enable = true;
  };
}
