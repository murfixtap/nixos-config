{ pkgs, ... }:
let
  loginWallpaper = pkgs.fetchurl {
    url = "https://w.wallhaven.cc/full/x6/wallhaven-x6x3gz.png";
    sha256 = "sha256-Yvtnxaj32YXpUkXQKF1VNcApQf0v3JXGp9TNAsoJmbM=";
  };
in
{
  programs.regreet = {
    enable = true;
    settings = {
      background = {
        path = loginWallpaper;
        fit = "Cover";
      };
    };
  };

  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.regreet}/bin/regreet";
        user = "greeter";
      };
    };
  };

  systemd.services.greetd.serviceConfig = {
    Type = "idle";
    StandardInput = "tty";
    StandardOutput = "tty";
    StandardError = "journal";
    TTYReset = true;
    TTYVHangup = true;
    TTYVTDisallocate = true;
  };
}
