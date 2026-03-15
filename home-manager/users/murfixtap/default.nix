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
    # --- Development & Nix ---
    nixd
    alejandra
    nodePackages.prettier
    docker-compose
    repomix

    # --- Basic CLI Utilities ---
    bat # `cat` alternative with syntax highlighting
    lsd # `ls` alternative with icons
    ripgrep # fast recursive grep
    fd # simple alternative to `find`
    fzf # fuzzy finder
    file # determine file type
    curl
    wget
    jq # JSON processor
    fastfetch # system information tool
    poppler # PDF utilities (pdfimages, pdftotext, etc.)

    # --- System Monitoring ---
    htop

    # --- File Management (GUI & Archives) ---
    thunar
    thunar-volman
    tumbler # thumbnail service for Thunar
    zip
    unzip
    p7zip

    # --- Multimedia & Graphics ---
    cmus # console audio player
    easyeffects # audio processing
    ffmpeg
    gimp
    mpv
    imv # lightweight image viewer
    playerctl # media player controller
    pear-desktop
    wiremix

    # --- Productivity ---
    bitwarden-desktop
    calcure # TUI calendar / planner
    obsidian
    taskwarrior3 # task management

    # --- Communication ---
    ayugram-desktop
    chatterino7

    # --- Fun & ASCII Art ---
    asciiquarium
    bastet # crazy tetris
    bonsai # grow a tree in your terminal
    clock-rs # terminal clock
    cmatrix
    cowsay
    fortune
    jp2a # convert images to ASCII
    nudoku # Sudoku
    peaclock # colorful terminal clock
    pipes-rs # animated pipes
    tetris # classic tetris
  ];

  programs.home-manager.enable = true;
  nixpkgs.config.allowUnfree = true;
}
