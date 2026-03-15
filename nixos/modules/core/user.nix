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
    ];
  };

  programs.fish.enable = true;
  virtualisation.docker.enable = true;
}
