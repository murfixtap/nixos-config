{ user, ... }: {
  programs.nh = {
    enable = true;
    flake = "/home/${user}/nixos-config";

    clean = {
      enable = true;
      dates = "weekly";
      extraArgs = "--keep-since 7d --keep 10";
    };
  };
}

