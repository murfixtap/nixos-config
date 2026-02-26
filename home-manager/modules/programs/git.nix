{...}: {
  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "murfixtap";
        email = "murfixtap@gmail.com";
      };
      init.defaultBranch = "main";
    };
  };
}
