{ ... }: {
  programs.kitty = {
    enable = true;
    settings = {
      font_family = "JetBrainsMono Nerd Font";
      font_size = 12;
      enable_audio_bell = "no";
      confirm_os_window_close = 0;
    };
  };
}
