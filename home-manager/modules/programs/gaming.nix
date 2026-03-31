{pkgs, ...}: {
  home.packages = with pkgs; [
    # Launchers
    lutris
    bottles
    prismlauncher # minecraft

    # Emulators
    pcsx2
    ppsspp-sdl-wayland

    # Games
    mindustry
    veloren
    supertuxkart
    openttd
    freeciv

    # Utils
    protonup-ng
    protonup-qt
  ];
}
