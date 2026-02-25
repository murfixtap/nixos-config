{ ... }: {
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 30;
        output = [ "HDMI-A-1" "DVI-D-1" ];

        modules-left = [ "hyprland/workspaces" ];
        modules-center = [ "clock" ];
        modules-right = [ "hyprland/language" "pulseaudio" "battery" "tray" ];

        "hyprland/workspaces" = {
          format = "{icon}";
          disable-scroll = true;
          show-special = true;
          special-visible-only = true;
          all-outputs = false;
          persistent-workspaces = {
            "1-7" = "HDMI-A-1";
            "8-10" = "DVI-D-1";
          };
        };

        "clock" = {
          format = " {:%I:%M %p}";
          format-alt = " {:%a, %b %d, %Y}";
          tooltip-format = "<tt><small>{calendar}</small></tt>";
        };

        "hyprland/language" = {
          format-en = "us";
          format-ru = "ru";
          min-length = 5;
          tooltip = false;
        };

        "pulseaudio" = {
          format = "{icon} {volume}%";
          format-muted = " ";
          format-icons = {
            "default" = [ " " " " ];
          };
          on-click = "pavucontrol";
        };

        "battery" = {
          states = { warning = 30; critical = 1; };
          format = "{icon} {capacity}%";
          format-icons = [ " " " " " " " " " " ];
        };

        "tray" = { icon-size = 18; spacing = 1; };
      };
    };
  };
}
