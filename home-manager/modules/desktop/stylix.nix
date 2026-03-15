{
  pkgs,
  inputs,
  ...
}: {
  imports = [inputs.stylix.homeModules.stylix];

  stylix = {
    enable = true;
    polarity = "dark";
    base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-macchiato.yaml";

    image = pkgs.fetchurl {
      url = "https://w.wallhaven.cc/full/yq/wallhaven-yqev5d.jpg";
      sha256 = "0kmm33jsmp3qx5xzph5bmvjdd5zp84vvr64rp8clvvz8h0va6min";
    };

    fonts = {
      monospace = {
        name = "JetBrainsMono NFP";
      };
      sansSerif = {
        name = "Inter";
      };
      serif = {
        name = "Lora";
      };
      emoji = {
        name = "Noto Color Emoji";
      };
      sizes = {
        terminal = 14;
        applications = 11;
      };
    };

    icons = {
      enable = true;
      package = pkgs.papirus-icon-theme;
      dark = "Papirus-Dark";
      light = "Papirus-Light";
    };

    cursor = {
      package = pkgs.phinger-cursors;
      name = "phinger-cursors-light";
      size = 24;
    };

    targets = {
      neovim.enable = false;
      waybar.enable = false;
      wofi.enable = false;
      btop.enable = false;
      # hyprland.enable = false;
      # hyprlock.enable = false;
      firefox.profileNames = ["default"];
    };
  };
}
