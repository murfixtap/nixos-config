{pkgs, ...}: {
  fonts.packages = with pkgs; [
    lora
    google-fonts

    # Noto Fonts
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-lgc-plus
    noto-fonts-color-emoji

    # Nerd Fonts
    nerd-fonts.roboto-mono
    nerd-fonts.jetbrains-mono
  ];

  fonts.fontconfig = {
    enable = true;
    defaultFonts = {
      monospace = ["JetBrainsMono NFP"];
      sansSerif = ["Inter"];
      serif = ["Lora"];
      emoji = ["Noto Color Emoji"];
    };
    antialias = true;
    hinting = {
      enable = true;
      style = "slight";
    };
    subpixel = {
      rgba = "rgb";
      lcdfilter = "default";
    };
  };
}
