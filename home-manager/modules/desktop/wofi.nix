{ ... }: {
  programs.wofi = {
    enable = true;
    settings = {
      allow_markup = true;
      allow_images = true;
      width = 400;
      height = 500;
    };
  };
}
