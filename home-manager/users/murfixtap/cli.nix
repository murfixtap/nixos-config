{pkgs, ...}: {
  imports = [
    ../../modules/editors/nixvim
    ../../modules/programs/btop.nix
    ../../modules/programs/cava.nix
    ../../modules/programs/git.nix
    ../../modules/programs/yazi.nix
    ../../modules/services/syncthing.nix
    ../../modules/shell/fish
    ../../modules/shell/starship
    ../../modules/shell/zoxide.nix
  ];

  home.packages = with pkgs; [
    # Development
    nil
    nixd
    alejandra
    devenv
    direnv
    basedpyright
    ruff
    prettier
    color-lsp
    repomix

    # CLI Core
    bat
    lsd
    jq
    fd
    fzf
    file
    ripgrep
    poppler

    # System
    fastfetch
    htop
    curl
    wget
    yt-dlp
    ffmpeg
    zellij

    # TUI
    wiremix
    calcure
    ncdu
    epr
    cmus
    termusic
    taskwarrior3

    # Terminal Visuals
    asciiquarium
    cbonsai
    clock-rs
    cmatrix
    peaclock
    pipes-rs
    jp2a

    # Games
    nudoku
    tetris
    bastet

    # Utils
    zip
    unzip
    p7zip
  ];
}
