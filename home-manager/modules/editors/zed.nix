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
  };
}
