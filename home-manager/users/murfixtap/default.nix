{
  pkgs,
  user,
  stateVersion,
  ...
}: {
  imports = [
    ../../modules/desktop/waybar
    ../../modules/desktop/wofi
    ../../modules/desktop/hyprland.nix
    ../../modules/desktop/mako.nix
    ../../modules/desktop/stylix.nix
    ../../modules/editors/kitty.nix
    ../../modules/editors/nixvim.nix
    ../../modules/editors/zed.nix
    ../../modules/programs/btop.nix
    ../../modules/programs/cava.nix
    ../../modules/programs/firefox.nix
    ../../modules/programs/git.nix
    ../../modules/programs/qutebrowser.nix
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
    # Development
    nil
    nixd
    alejandra
    python3
    basedpyright
    ruff
    nodePackages.prettier
    color-lsp
    repomix
    docker-compose

    # CLI Core
    bat
    lsd
    ripgrep
    fd
    fzf
    file
    jq
    poppler

    # System & Network
    htop
    fastfetch
    curl
    wget
    yt-dlp
    syncthing

    # TUI Workspace
    zellij
    calcure
    taskwarrior3
    cmus
    termusic

    # Terminal Visuals
    clock-rs
    peaclock
    asciiquarium
    cbonsai
    cmatrix
    pipes-rs
    jp2a
    cowsay
    fortune

    # Terminal Games
    bastet
    nudoku
    tetris

    # File Management
    thunar
    thunar-volman
    tumbler
    zip
    unzip
    p7zip

    # Audio Setup
    pavucontrol
    easyeffects
    qpwgraph
    wiremix

    # Media & Graphics
    mpv
    imv
    gimp
    inkscape
    ffmpeg
    kid3
    playerctl

    # Desktop Apps
    obsidian
    bitwarden-desktop
    localsend
    qbittorrent
    ayugram-desktop
    chatterino7
    pear-desktop
    gnome-calculator

    # Wine
    wineWow64Packages.staging
    winetricks
    wineasio
    bottles
  ];

  programs.home-manager.enable = true;
  nixpkgs.config.allowUnfree = true;
}
