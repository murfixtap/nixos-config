{...}: let
  screensPath = "$HOME/Pictures/screenshots";
in {
  wayland.windowManager.hyprland = {
    settings = {
      "$mainMod" = "SUPER";
      "$terminal" = "kitty";
      "$fileManager" = "yazi";
      "$browser" = "librewolf";
      "$editor" = "zeditor";
      "$menu" = "rofi -show";

      bind =
        [
          # General
          "$mainMod, Return, exec, uwsm app -- $terminal"
          "$mainMod, E, exec, uwsm app -- $terminal -e $fileManager"
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
          "$mainMod ALT, C, exec, uwsm app -- hyprpicker -a -f hex"

          # Clipboard history
          "$mainMod ALT, V, exec, uwsm app -- $terminal --class clipse -e clipse"

          # Others
          ", XF86Reload, exec, hyprctl reload"
          ", XF86Tools, exec, uwsm app -- $terminal -e cmus"
          ", XF86Calculator, exec, uwsm app -- gnome-calculator"
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
