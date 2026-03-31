{user, ...}: {
  programs.virt-manager.enable = true;
  virtualisation.libvirtd.enable = true;
  users.users.${user}.extraGroups = ["libvirtd"];

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
