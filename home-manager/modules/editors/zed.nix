{...}: {
  programs.zed-editor = {
    enable = true;
    extensions = [
      "python"
      "nix"
      "git"
      "toml"
      "xml"
    ];
    userSettings = {
      languages = {
        Python = {
          language_servers = ["basedpyright" "ruff"];
          formatter = {
            external = {
              command = "ruff";
              arguments = ["-"];
            };
          };
        };
      };
    };
  };
}
