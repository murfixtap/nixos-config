{flakePath, ...}: {
  programs.nh = {
    enable = true;
    flake = "${flakePath}";

    clean = {
      enable = true;
      dates = "weekly";
      extraArgs = "--keep-since 7d --keep 10";
    };
  };
}
