{ pkgs, ... }:
{
  imports = [
    ../modules/desktop/xfce.nix
    ../modules/core/audio.nix
    ../modules/core/boot.nix
    ../modules/core/firewall.nix
    ../modules/core/fonts.nix
    ../modules/core/networking.nix
    ../modules/core/nh.nix
    ../modules/core/nix.nix
    ../modules/core/timezone.nix
    ../modules/core/user.nix
    ../modules/core/zram.nix
  ];

  environment.systemPackages = with pkgs; [
    xfce4-clipman-plugin
    xclip
  ];

  nixpkgs.config.allowUnfree = true;
}
