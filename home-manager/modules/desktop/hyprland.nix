{...}: let
  screensPath = "$HOME/Pictures/screenshots";
in {
  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = false;

    settings = {
      "$mainMod" = "SUPER";
      "$terminal" = "kitty";
      "$fileManager" = "yazi";
      "$browser" = "firefox";
      "$editor" = "zeditor";
      "$menu" = "wofi --show drun";

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
        "uwsm app -- easyeffects --gapplication-service"
        "uwsm app -- hyprsunset --temperature 3000K"
        "uwsm app -- wl-paste --type text --watch cliphist store"
        "uwsm app -- wl-paste --type image --watch cliphist store"
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

      bind =
        [
          # General
          "$mainMod, Return, exec, uwsm app -- $terminal"
          "$mainMod, E, exec, uwsm app -- $terminal -e $fileManager"
          "$mainMod, R, exec, uwsm app -- $menu"
          "$mainMod, V, togglefloating,"
          "$mainMod, F, fullscreen,"
          "$mainMod, Q, killactive,"
          "$mainMod SHIFT, Q, exit,"
          "$mainMod SHIFT, O, pseudo,"
          "$mainMod SHIFT, I, togglesplit,"

          # Move focus
          "$mainMod, h, movefocus, l"
          "$mainMod, l, movefocus, r"
          "$mainMod, k, movefocus, u"
          "$mainMod, j, movefocus, d"

          # Move window
          "$mainMod SHIFT, h, movewindow, l"
          "$mainMod SHIFT, l, movewindow, r"
          "$mainMod SHIFT, k, movewindow, u"
          "$mainMod SHIFT, j, movewindow, d"

          # Screenshots
          ", Print, exec, uwsm app -- hyprshot -m region -o ${screensPath}"
          "$mainMod, Print, exec, uwsm app -- hyprshot -m window -o ${screensPath}"
          "$mainMod SHIFT, Print, exec, uwsm app -- hyprshot -m output -o ${screensPath}"

          # Color Picker
          "$mainMod SHIFT, C, exec, uwsm app -- hyprpicker -a -f hex"

          # Apps
          "$mainMod SHIFT, F, exec, uwsm app -- $browser"
          "$mainMod SHIFT, Z, exec, uwsm app -- $editor"

          # Others
          ", XF86Reload, exec, hyprctl reload"
          ", XF86Tools, exec, uwsm app -- $terminal -e cmus"
          ", XF86Calculator, exec, uwsm app -- gnome-calculator"

          # Clipboard history
          "$mainMod SHIFT, V, exec, uwsm app -- cliphist list | wofi --show dmenu | cliphist decode | wl-copy"
        ]
        ++ (
          # Generators for workspaces 1-10
          builtins.concatLists (
            builtins.genList (
              x: let
                ws = x + 1;
                key =
                  if ws == 10
                  then "0"
                  else toString ws;
              in [
                "$mainMod, ${key}, workspace, ${toString ws}"
                "$mainMod SHIFT, ${key}, movetoworkspacesilent, ${toString ws}"
              ]
            )
            10
          )
        );

      # Mouse
      bindm = [
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
      ];

      # Repeatable
      binde = [
        # Resize windows
        "$mainMod CTRL, h, resizeactive, -20 0"
        "$mainMod CTRL, l, resizeactive, 20 0"
        "$mainMod CTRL, k, resizeactive, 0 -20"
        "$mainMod CTRL, j, resizeactive, 0 20"

        # Hyprsunset (w/o uwsm, because it is hyprctl)
        ", XF86Explorer, exec, hyprctl hyprsunset gamma -5"
        ", XF86Mail, exec, hyprctl hyprsunset gamma +5"
        ", XF86HomePage, exec, hyprctl hyprsunset temperature -100"
        ", XF86Search, exec, hyprctl hyprsunset temperature +100"
      ];

      # Media (locked)
      bindl = [
        ", XF86AudioPrev, exec, playerctl previous"
        ", XF86AudioPlay, exec, playerctl play-pause"
        ", XF86AudioNext, exec, playerctl next"
      ];

      # Volume (repeatable + locked)
      bindel = [
        ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
        ", XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
        ", XF86AudioRaiseVolume, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"
      ];
    };
  };
}
