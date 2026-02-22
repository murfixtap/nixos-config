{ ... }: {
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;

    extraConfig = ''
      set number
      set relativenumber
      set shiftwidth=2
      set tabstop=2
      set softtabstop=2
      set expandtab
      set shiftround
      set autoindent
      set smartindent
      set cursorline
      set ignorecase
      set smartcase
      set incsearch
      set hlsearch
    '';
  };
}
