{ ... }: {
  services.mako = {
    enable = true;

    #appearance
    # backgroundColor = "";
    # textColor = "";
    # borderColor = "";
    borderSize = 3;
    width = 300;
    padding = "10";
    margin = "10";
    borderRadius = 5;

    #behavior
    defaultTimeout = 5000;
    maxVisible = 3;

    #position
    anchor = "top-right";
  };
}
