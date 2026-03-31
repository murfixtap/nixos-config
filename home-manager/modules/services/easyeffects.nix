{
  lib,
  pkgs,
  ...
}: {
  services.easyeffects.enable = true;

  systemd.user.services.easyeffects = {
    Unit = {
      Requires = ["pipewire.socket"];
      After = ["pipewire.socket"];
    };

    Service = {
      ExecStartPre = "${pkgs.coreutils}/bin/sleep 3";
      ExecStart = lib.mkForce "${pkgs.easyeffects}/bin/easyeffects --gapplication-service";
      Restart = "on-failure";
      RestartSec = 5;
    };

    Install = {
      WantedBy = ["graphical-session.target"];
    };
  };
}
