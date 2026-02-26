{...}: {
  programs.starship = {
    enable = true;
    enableFishIntegration = true;

    settings =
      (fromTOML (builtins.readFile ./nerd-font-symbols.toml))
      // {
        character = {
          success_symbol = "[ ](bold blue)";
          error_symbol = "[ ](bold red)";
        };
      };
  };
}
