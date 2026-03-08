{pkgs, ...}: {
  imports = [
    ../modules/desktop/hyprland.nix
    ../modules/core/audio.nix
    ../modules/core/boot.nix
    ../modules/core/firewall.nix
    ../modules/core/fonts.nix
    ../modules/core/networking.nix
    ../modules/core/nh.nix
    ../modules/core/nix.nix
    ../modules/core/timezone.nix
    ../modules/core/user.nix
    ../modules/core/zram.nix
  ];

  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.tuigreet}/bin/tuigreet --time --remember --remember-session --cmd \"uwsm start -e -D Hyprland hyprland.desktop\"";
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

  environment.systemPackages = with pkgs; [
    cliphist
    wl-clipboard
    hyprpolkitagent
    hyprsunset
    hyprshot
    hyprpicker
  ];

  nixpkgs.config.allowUnfree = true;
}
