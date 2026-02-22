{ ... }: {
  programs.fish = {
    enable = true;

    shellInit = ''
      set -g fish_greeting
    '';

    shellAliases = {
      # System
      n = "nvim";
      cat = "bat";

      # LSD
      ls = "lsd";
      la = "lsd -a";
      ll = "lsd -l";
      lla = "lsd -la";
      lt = "lsd --tree";

      # nh
      nswitch = "nh os switch";
      nupdate = "nh os switch --update";
      nhome = "nh home switch";
    };
  };
}
