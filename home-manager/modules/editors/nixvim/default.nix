{
  inputs,
  pkgs,
  ...
}: {
  imports = [
    inputs.nixvim.homeModules.nixvim
    ./keymaps.nix
    ./options.nix
    ./plugins.nix
    ./styling.nix
  ];

  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    globals.mapleader = " "; # Space

    extraPackages = with pkgs; [
      nodePackages.prettier
      nodePackages.eslint_d
      nodePackages.stylelint
      rust-analyzer
      rustfmt
      stylua
      taplo
      ruff
    ];
  };
}
