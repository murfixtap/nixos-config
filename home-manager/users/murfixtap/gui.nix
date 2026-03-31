{pkgs, ...}: {
  imports = [
    ../../modules/desktop/hyprland
    ../../modules/desktop/rofi
    ../../modules/desktop/waybar
    ../../modules/desktop/mako.nix
    ../../modules/desktop/stylix.nix
    ../../modules/editors/kitty.nix
    ../../modules/editors/zed.nix
    ../../modules/programs/browsers/firefox.nix
    ../../modules/programs/browsers/librewolf.nix
    ../../modules/programs/gaming.nix
    ../../modules/services/easyeffects.nix
  ];

  home.packages = with pkgs; [
    # File Management
    thunar
    thunar-volman
    tumbler

    # Audio/Video
    pavucontrol
    playerctl
    qpwgraph
    mpv
    imv

    # Graphics
    kid3
    gimp
    inkscape
    blender

    # Desktop Apps
    bitwarden-desktop
    ayugram-desktop
    pear-desktop
    obsidian
    localsend
    qbittorrent
    chatterino7
    gnome-calculator
  ];
}
