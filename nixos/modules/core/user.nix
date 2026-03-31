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
      "render"
      "pipewire"
      "input"
    ];
  };

  programs = {
    fish.enable = true;
    dconf.enable = true;
  };
}
