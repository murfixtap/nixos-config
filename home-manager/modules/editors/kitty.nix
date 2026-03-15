{...}: {
  programs.kitty = {
    enable = true;
    settings = {
      enable_audio_bell = "no";
      confirm_os_window_close = 0;
      repaint_delay = 8;
      input_delay = 2;
      sync_to_monitor = "yes";
      update_check_interval = 0;
      linux_display_server = "wayland";
    };
  };
}
