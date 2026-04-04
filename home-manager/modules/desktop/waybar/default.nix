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
        height = 32;
        margin = "5px 5px 0 5px";
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
          format = "";
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
          format = "{:%Y.%m.%d | %I:%M %p}";
          format-alt = " {:%a, %b %d, %Y}";
          tooltip-format = "<tt><small>{calendar}</small></tt>";
          on-click-right = "uwsm app -- kitty -e calcure";

          calendar = {
            mode = "year";
            mode-mon-col = 3;
            weeks-pos = "right";
            on-scroll = 1;

            format = {
              months = "<span color='#eed49f'><b>{}</b></span>";
              days = "<span color='#cad3f5'><b>{}</b></span>";
              weeks = "<span color='#a6da95'><b>W{}</b></span>";
              weekdays = "<span color='#ee99a0'><b>{}</b></span>";
              today = "<span color='#ed8796'><b><u>{}</u></b></span>";
            };
          };
        };

        "custom/uptime" = {
          format = " {}";
          exec = "uptime | sed 's/.*up \\+\\([^,]*\\),.*/\\1/'";
          interval = 60;
          tooltip = false;
        };

        "custom/clipboard" = {
          "format" = "";
          "on-click" = "uwsm app -- kitty --class clipse -e clipse";
          "tooltip" = false;
        };

        "cpu" = {
          interval = 5;
          format = " {usage}%";
          on-click = "uwsm app -- kitty -e btop";
        };

        "memory" = {
          interval = 5;
          format = " {}%";
          tooltip-format = "{used:0.1f}G used out of {total:0.1f}G";
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
            critical = 10;
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
