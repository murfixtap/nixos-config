{
  pkgs,
  user,
  stateVersion,
  ...
  imports = [
    ../../modules/desktop/waybar
    ../../modules/desktop/hyprland.nix
    ../../modules/desktop/mako.nix
    ../../modules/desktop/stylix.nix
    ../../modules/desktop/wofi.nix
    ../../modules/editors/kitty.nix
    ../../modules/editors/nixvim.nix
    ../../modules/editors/zed.nix
    ../../modules/programs/firefox.nix
    ../../modules/programs/git.nix
    ../../modules/programs/yazi.nix
    ../../modules/shell/starship
    ../../modules/shell/fish.nix
    ../../modules/shell/zoxide.nix
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

  home.packages = with pkgs; [
    nixd
    alejandra
    docker-compose
    bat
    lsd
    zip
    unzip
    p7zip
    ripgrep
    htop
    btop
    curl
    wget
    repomix
    wiremix
    ayugram-desktop
    bitwarden-desktop
  ];

  programs.home-manager.enable = true;
}
