{
  user,
  stateVersion,
  ...
}: {
  imports = [
    ./cli.nix
    ./gui.nix
  ];

  home = {
    username = user;
    homeDirectory = "/home/${user}";
    stateVersion = stateVersion;

    sessionPath = [
      "$HOME/.local/bin"
    ];

    sessionVariables = {
      EDITOR = "nvim";
      TERMINAL = "kitty";
    };
  };

  xdg.userDirs = {
    enable = true;
    createDirectories = true;

    documents = "$HOME/Documents";
    download = "$HOME/Downloads";
    desktop = "$HOME/Desktop";
    music = "$HOME/Music";
    pictures = "$HOME/Pictures";
    videos = "$HOME/Videos";
    templates = "$HOME/Templates";
    publicShare = "$HOME/Public";
  };

  programs.home-manager.enable = true;
  nixpkgs.config.allowUnfree = true;
}
