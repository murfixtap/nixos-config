{...}: {
  networking.networkmanager = {
    enable = true;
    waitOnline.enable = false;
  };
}
