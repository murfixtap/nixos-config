{
  pkgs,
  user,
  ...
}: {
  users.users.${user} = {
    shell = pkgs.fish;
    isNormalUser = true;
    extraGroups = [
      "networkmanager"
      "wheel"
      "video"
      "audio"
      "docker"
      "render"
      "libvirtd"
    ];
  };

  programs = {
    fish.enable = true;
    dconf.enable = true;
    virt-manager.enable = true;
  };

  virtualisation = {
    docker.enable = true;
    libvirtd.enable = true;
  };

  security.polkit = {
    enable = true;
    extraConfig = ''
      polkit.addRule(function(action, user) {
        if (action.id == "org.libvirt.unix.manage" &&
            user.isInGroup("libvirtd")) {
          return polkit.Result.YES;
        }
      });
    '';
  };
}
