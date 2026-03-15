{...}: {
  programs.qutebrowser = {
    enable = true;
    settings = {
      qt.args = ["platform=wayland"];
    };
  };
}
