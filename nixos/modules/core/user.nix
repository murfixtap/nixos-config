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
    ];
  };

  programs.fish.enable = true;
  virtualisation.docker.enable = true;
}
