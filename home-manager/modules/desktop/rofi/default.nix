{pkgs, ...}: {
  programs.rofi = {
    enable = true;
    terminal = "kitty";
    package = pkgs.rofi;
    theme = ./catppuccin.rasi;

    extraConfig = {
      show-icons = false;
      sidebar-mode = true;

      modi = "run,drun,window";
      modes = "run,drun,window,ssh,calc,emoji";
      drun-display-format = "{icon} {name}";
      display-drun = " Apps";
      display-run = " Run";
      display-window = " Window";
      display-ssh = " SSH";
      display-calc = " Calc";
      display-emoji = "󰞅 Emoji";

      window-format = "{i}{w} {c} {t}";
    };

    plugins = with pkgs; [
      rofi-calc
      rofi-emoji
    ];
  };

  home.packages = with pkgs; [
    rofi-power-menu
  ];
}
