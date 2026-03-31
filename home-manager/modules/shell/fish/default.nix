{...}: {
  imports = [
    ./abbrs.nix
    ./plugins.nix
  ];

  programs.fish = {
    enable = true;
    shellInit = ''
      set -g fish_greeting
    '';
  };
}
