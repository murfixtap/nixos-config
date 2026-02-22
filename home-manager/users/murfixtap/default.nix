{ pkgs, user, stateVersion, ... }:
{
  imports = [
    ../../modules/editors/kitty.nix
    ../../modules/editors/neovim.nix
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
  };

  home.packages = with pkgs; [
    bat
    lsd
    zip
    unzip
    p7zip
    ripgrep
    btop
    wiremix
    ayugram-desktop
    bitwarden-desktop
  ];

  programs.home-manager.enable = true;
}
