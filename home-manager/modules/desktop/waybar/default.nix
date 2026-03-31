{flakePath, ...}: let
  rofiPath = "${flakePath}/home-manager/modules/desktop/rofi";
in {
  programs.waybar = {
    enable = true;
    style = ./style.css;
    settings = [
      {
        layer = "top";
        position = "top";
        height = 30;
        margin = "5 5 0 5";
        spacing = 0;

        modules-left = ["custom/menu" "hyprland/workspaces"];
        modules-center = ["clock" "custom/uptime" "cpu" "memory"];
        modules-right = ["custom/clipboard" "hyprland/language" "pulseaudio" "tray" "custom/power"];

        "custom/menu" = {
          format = "<span foreground='#89abf4'></span>";
          min-length = 2;
          on-click = "uwsm app -- rofi -show drun -show-icons";
        };

        "hyprland/workspaces" = {
          format = "{icon}";
          disable-scroll = true;
          show-special = true;
          special-visible-only = false;
          all-outputs = false;

          persistent-workspaces = {
            "HDMI-A-1" = ["1" "2" "3" "4" "5" "6" "7"];
            "DVI-D-1" = ["8" "9" "10"];
          };
        };

        "clock" = {
          format = "{:%I:%M %p}";
          format-alt = " {:%a, %b %d, %Y}";
          tooltip-format = "<tt><small>{calendar}</small></tt>";
          on-click-right = "uwsm app -- kitty -e calcure";
        };

        "custom/uptime" = {
          format = " {}";
          exec = "uptime | sed 's/.*up \\+\\([^,]*\\),.*/\\1/'";
          interval = 60;
          tooltip = false;
        };

        "cpu" = {
          interval = 10;
          format = " {}%";
          on-click = "uwsm app -- kitty -e btop";
        };

        "memory" = {
          interval = 10;
          format = " {used:0.1f}G/{total:0.1f}G";
          on-click = "uwsm app -- kitty -e btop";
        };

        "hyprland/language" = {
          format = " {}";
          format-en = "US";
          format-ru = "RU";
          min-length = 5;
          tooltip = false;
          on-click = "hyprctl switchxkblayout all next";
        };

        "pulseaudio" = {
          format = " {volume}%";
          format-muted = " muted";
          on-click = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
          on-click-middle = "uwsm app -- easyeffects";
          on-click-right = "uwsm app -- kitty -e wiremix";
        };

        "battery" = {
          states = {
            warning = 30;
            critical = 1;
          };
          format = "{icon} {capacity}%";
          format-icons = ["" "" "" "" ""];
        };

        "tray" = {
          icon-size = 18;
          spacing = 10;
        };

        "custom/power" = {
          format = "<span foreground='#ed8796'></span>";
          min-length = 2;
          on-click = "uwsm app -- rofi -show p -modi p:rofi-power-menu -theme ${rofiPath}/powermenu.rasi";
        };
      }
    ];
  };
}
