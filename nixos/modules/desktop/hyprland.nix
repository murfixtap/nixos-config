{ pkgs, ... }: {
  programs.hyprland = {
    enable = true;
    withUWSM = true; # Universal Wayland Session Manager
    xwayland.enable = true;
  };

  xdg.portal = {
    enable = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-hyprland
      pkgs.xdg-desktop-portal-gtk
    ];
    config.common.default = "*"; # Tell the system to use any available portal
  };
}
