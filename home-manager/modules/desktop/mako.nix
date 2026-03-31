{...}: {
  services.mako = {
    enable = true;
    settings = {
      #appearance
      border-size = 3;
      width = 300;
      padding = "10";
      margin = "10";
      border-radius = 5;

      #behavior
      default-timeout = 5000;
      max-visible = 3;

      #position
      anchor = "top-right";
    };
  };
}
