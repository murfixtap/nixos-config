{...}: {
  imports = [
    ./binds.nix
    ./submaps.nix
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = false;

    settings = {
      env = [
        # Hint Electron apps to use Wayland
        "NIXOS_OZONE_WL,1"
        "XDG_CURRENT_DESKTOP,Hyprland"
        "XDG_SESSION_TYPE,wayland"
        "XDG_SESSION_DESKTOP,Hyprland"
        "QT_QPA_PLATFORM,wayland"
        "MOZ_ENABLE_WAYLAND,1"
      ];

      monitor = [
        "HDMI-A-1,1920x1080@60,0x0,1"
        "DVI-D-1,1920x1080@60,1920x-420,1,transform,3"
      ];

      exec-once = [
        "uwsm app -- systemctl --user start hyprpolkitagent"
        "uwsm app -- hyprsunset --temperature 3000K"
        "uwsm app -- wl-paste --type text --watch cliphist store"
        "uwsm app -- wl-paste --type image --watch cliphist store"
        "uwsm app -- clipse -listen"
        "uwsm app -- waybar"
        "uwsm app -- mako"
      ];

      general = {
        gaps_in = 5;
        gaps_out = 10;
        border_size = 3;
        # "col.active_border" = "rgba(d65d0eff) rgba(98971aff) 45deg";
        # "col.inactive_border" = "rgba(3c3836ff)";
        allow_tearing = false;
        layout = "dwindle";
      };

      decoration = {
        rounding = 5;
        active_opacity = 1.0;
        inactive_opacity = 1.0;
        shadow.enabled = false;
        blur.enabled = false;
      };

      animations.enabled = false;

      input = {
        #keyboard
        kb_layout = "us,ru";
        kb_options = "grp:caps_toggle,compose:ralt";
        repeat_rate = 35;
        repeat_delay = 200;

        #mouse
        accel_profile = "flat";
        force_no_accel = true;
        sensitivity = -0.5;
      };

      dwindle = {
        pseudotile = true;
        preserve_split = true;
      };

      master = {
        new_status = "slave";
        new_on_top = true;
        mfact = 0.5;
      };

      misc = {
        force_default_wallpaper = 0;
        disable_hyprland_logo = true;
      };

      workspace = [
        "1, monitor:HDMI-A-1"
        "2, monitor:HDMI-A-1"
        "3, monitor:HDMI-A-1"
        "4, monitor:HDMI-A-1"
        "5, monitor:HDMI-A-1"
        "6, monitor:HDMI-A-1"
        "7, monitor:HDMI-A-1"
        "8, monitor:DVI-D-1"
        "9, monitor:DVI-D-1"
        "10, monitor:DVI-D-1"
      ];
    };
  };
}
