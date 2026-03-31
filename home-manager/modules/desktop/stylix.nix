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
      url = "https://w.wallhaven.cc/full/m9/wallhaven-m91yg1.jpg"; # https://whvn.cc/m91yg1
      sha256 = "0vw6qasrg1514km0bahdj8m1fmip8hhd2s5p2asv8dv4yfh0dya2";
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
      rofi.enable = false;
      btop.enable = false;
      # hyprland.enable = false;
      # hyprlock.enable = false;
      firefox.profileNames = ["default"];
      librewolf.profileNames = ["default"];
    };
  };
}
