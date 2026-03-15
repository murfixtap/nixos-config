{
  inputs,
  flakePath,
  ...
}: {
  imports = [
    inputs.nixvim.homeModules.nixvim
  ];

  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;

    globals.mapleader = " "; # space

    opts = {
      # general settings
      clipboard = "unnamedplus";
      mouse = "a";
      splitbelow = true;
      splitright = true;
      timeoutlen = 500;
      termguicolors = true;
      completeopt = "menuone,noselect";
      updatetime = 300;

      #linenumbers
      number = true;
      relativenumber = true;
      wrap = false;
      cursorline = true;
      signcolumn = "yes";
      scrolloff = 8;
      sidescrolloff = 5;

      #tab settings
      tabstop = 2;
      softtabstop = 2;
      shiftwidth = 2;
      expandtab = true;
      shiftround = true;
      smartindent = true;

      #search
      ignorecase = true;
      smartcase = true;
      incsearch = true;
      hlsearch = true;

      #swap
      swapfile = false;
      backup = false;
      writebackup = false;
      undofile = true;

      #text stuff
      list = true;
      listchars = {
        tab = "󰌒 ";
        trail = "•";
        extends = "»";
        precedes = "«";
      };

      #fold your laundry
      foldmethod = "indent";
      foldlevel = 99;
      foldenable = false;
    };

    keymaps = [
      # write and quit
      {
        mode = "n";
        key = "<leader>w";
        action = ":w<CR>";
        options.silent = false;
      }
      {
        mode = "n";
        key = "<leader>q";
        action = ":qa<CR>";
        options.silent = false;
      }

      #LSP
      {
        mode = "n";
        key = "gd";
        action = "<cmd>lua vim.lsp.buf.definition()<CR>";
        options.silent = true;
      }
      {
        mode = "n";
        key = "gr";
        action = "<cmd>lua vim.lsp.buf.references()<CR>";
        options.silent = true;
      }
      {
        mode = "n";
        key = "K";
        action = "<cmd>lua vim.lsp.buf.hover()<CR>";
        options.silent = true;
      }
      {
        mode = "n";
        key = "<leader>rn";
        action = "<cmd>lua vim.lsp.buf.rename()<CR>";
        options.silent = true;
      }

      #telescope
      {
        mode = "n";
        key = "<leader>ff";
        action = "<cmd>Telescope find_files<CR>";
        options.silent = true;
      }
      {
        mode = "n";
        key = "<leader>fg";
        action = "<cmd>Telescope live_grep<CR>";
        options.silent = true;
      }
      {
        mode = "n";
        key = "<leader>fb";
        action = "<cmd>Telescope buffers<CR>";
        options.silent = true;
      }
      {
        mode = "n";
        key = "<leader>fh";
        action = "<cmd>Telescope help_tags<CR>";
        options.silent = true;
      }

      #nvim tree
      {
        mode = "n";
        key = "<leader>e";
        action = "<cmd>NvimTreeToggle<CR>";
        options.silent = true;
      }

      #gitsigns
      {
        mode = "n";
        key = "<leader>lp";
        action = "<cmd>lua require('gitsigns').preview_hunk()<CR>";
        options.silent = true;
      }

      #lazygit
      {
        mode = "n";
        key = "<leader>lg";
        action = "<cmd>LazyGit<CR>";
        options.silent = true;
      }

      #bufferline
      {
        mode = "n";
        key = "<leader>bn";
        action = "<cmd>enew<CR>";
        options.silent = true;
      }
      {
        mode = "n";
        key = "<S-l>";
        action = "<cmd>BufferLineCycleNext<CR>";
      }
      {
        mode = "n";
        key = "<S-h>";
        action = "<cmd>BufferLineCyclePrev<CR>";
      }
      {
        mode = "n";
        key = "<leader>x";
        action = "<cmd>bdelete<CR>";
      }
    ];

    plugins = {
      treesitter = {
        enable = true;
        settings = {
          ensure_installed = [
            "nix"
            "python"
            "css"
            "scss"
            "html"
            "javascript"
            "lua"
          ];
          highlight.enable = true;
        };
      };

      lsp = {
        enable = true;
        servers = {
          python.enable = true;
          cssls.enable = true;

          nixd = {
            enable = true;
            settings = {
              nixpkgs = {
                expr = "import <nixpkgs> { }";
              };
              formatting = {
                command = ["alejandra"];
              };
              options = {
                nixos = {
                  expr = "(builtins.getFlake \"${flakePath}\").nixosConfigurations.luna.options";
                };
                "home-manager" = {
                  expr = "(builtins.getFlake \"${flakePath}\").nixosConfigurations.luna.options.home-manager.users.type.getSubOptions [ ]";
                };
              };
            };
          };
        };
      };

      cmp = {
        enable = true;
        autoEnableSources = true;
        settings = {
          sources = [
            {name = "nvim_lsp";}
            {name = "path";}
            {name = "buffer";}
          ];
          mapping = {
            "<Tab>" = "cmp.mapping.select_next_item()";
            "<S-Tab>" = "cmp.mapping.select_prev_item()";
            "<CR>" = "cmp.mapping.confirm({ select = true })";
          };
        };
      };
      cmp-nvim-lsp.enable = true;

      conform-nvim = {
        enable = true;
        settings = {
          formatters_by_ft = {
            nix = ["alejandra"]; # or "nixpkgs-fmt"
            python = ["black"];
            css = ["prettier"];
            scss = ["prettier"];
            html = ["prettier"];
            javascript = ["prettier"];
          };
          format_on_save = {
            lsp_fallback = true;
            timeout_ms = 500;
          };
        };
      };

      telescope = {
        enable = true;
        extensions."fzf-native" = {
          enable = true;
          settings = {
            fuzzy = true;
            override_file_sorter = true;
            override_generic_sorter = true;
            case_mode = "smart_case";
          };
        };

        settings = {
          defaults = {
            layout_config = {
              prompt_position = "top";
            };
            sorting_strategy = "ascending";
          };
          pickers.find_files.hidden = true;
        };
      };

      nvim-tree = {
        enable = true;
        openOnSetup = false;
        settings = {
          filters.dotfiles = false;
        };
      };

      gitsigns = {
        enable = true;
        settings = {
          attach_to_untracked = true;
          current_line_blame = true;
          current_line_blame_opts = {
            delay = 0;
            virt_text_pos = "eol";
          };
        };
      };

      lazygit = {
        enable = true;
        settings = {
          floating_window_winblend = 0;
          floating_window_scaling_factor = 0.9;
        };
      };

      lualine = {
        enable = true;
        settings.options = {
          theme = "catppuccin";
          icons_enabled = true;
        };
      };

      bufferline = {
        enable = true;
        settings.options = {
          always_show_bufferline = true;
          offsets = [
            {
              filetype = "NvimTree";
              text = "File Explorer";
              highlight = "Directory";
              separator = true;
            }
          ];
        };
      };

      dashboard = {
        enable = true;
        settings = {
          theme = "doom";
          config = {
            header = [
              "┌──────────────────────────────┐"
              "│   Welcome back, murfixtap!   │"
              "└──────────────────────────────┘"
            ];
            center = [
              {
                icon = " ";
                desc = "Find file";
                key = "f";
                action = "Telescope find_files";
              }
              {
                icon = " ";
                desc = "Live grep";
                key = "g";
                action = "Telescope live_grep";
              }
              {
                icon = " ";
                desc = "File tree";
                key = "e";
                action = "NvimTreeToggle";
              }
              {
                icon = "󰈆 ";
                desc = "Quit";
                key = "q";
                action = "qa";
              }
            ];
          };
        };
      };

      web-devicons.enable = true;
    };

    colorschemes.catppuccin = {
      enable = true;
      settings.flavour = "macchiato";
    };
  };
}
