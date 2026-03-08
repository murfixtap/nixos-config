{...}: {
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    pulse.enable = true;
    wireplumber.extraConfig = {
      "10-disable-suspend" = {
        "monitor.alsa.rules" = [
          {
            matches = [{"node.name" = "~alsa_output.*";}];
            actions = {
              update-props = {
                "session.suspend-on-idle" = false;
              };
            };
          }
        ];
      };
    };
  };
}
