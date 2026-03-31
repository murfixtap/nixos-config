{...}: {
  programs.nixvim = {
    opts = {
      # General
      clipboard = "unnamedplus";
      mouse = "a";
      splitbelow = true;
      splitright = true;
      timeoutlen = 500;
      termguicolors = true;
      completeopt = "menuone,noselect";
      updatetime = 300;
      # Interface
      number = true;
      relativenumber = true;
      wrap = false;
      cursorline = true;
      signcolumn = "yes";
      scrolloff = 8;
      sidescrolloff = 5;
      # Tabs
      tabstop = 2;
      softtabstop = 2;
      shiftwidth = 2;
      expandtab = true;
      smartindent = true;
      # Search and files
      ignorecase = true;
      smartcase = true;
      incsearch = true;
      hlsearch = true;
      swapfile = false;
      undofile = true;
      # Text design
      list = true;
      listchars = {
        tab = "󰌒 ";
        trail = "•";
        extends = "»";
        precedes = "«";
      };
    };
  };
}
