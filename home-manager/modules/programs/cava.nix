{
  programs.cava = {
    enable = true;
    settings = {
      general = {
        monstercat = 0;
        framerate = 144;
      };

      input = {
        method = "pipewire";
        source = "auto";
      };

      output = {
        channels = "mono";
      };

      smoothing = {
        integral = 100;
        gravity = 50;
      };

      color = {
        gradient = 1;

        gradient_color_1 = "'#8BE9FD'";
        gradient_color_2 = "'#9AEDFE'";
        gradient_color_3 = "'#CAA9FA'";
        gradient_color_4 = "'#BD93F9'";
        gradient_color_5 = "'#FF92D0'";
        gradient_color_6 = "'#FF79C6'";
        gradient_color_7 = "'#FF6E67'";
        gradient_color_8 = "'#FF5555'";
      };
    };
  };
}
