{...}: {
  programs.nixvim = {
    plugins = {
      web-devicons.enable = true;
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

      lualine = {
        enable = true;
        settings.options = {
          theme = "catppuccin";
          icons_enabled = true;
          component_separators = {
            left = "";
            right = "";
          };
          section_separators = {
            left = "";
            right = "";
          };
        };
      };

      dashboard = {
        enable = true;
        settings = {
          theme = "doom";
          config = {
            header = [
              " "
              "███╗   ██╗██╗██╗  ██╗██╗   ██╗██╗███╗   ███╗"
              "████╗  ██║██║╚██╗██╔╝██║   ██║██║████╗ ████║"
              "██╔██╗ ██║██║ ╚███╔╝ ██║   ██║██║██╔████╔██║"
              "██║╚██╗██║██║ ██╔██╗ ╚██╗ ██╔╝██║██║╚██╔╝██║"
              "██║ ╚████║██║██╔╝ ██╗ ╚████╔╝ ██║██║ ╚═╝ ██║"
              "╚═╝  ╚═══╝╚═╝╚═╝  ╚═╝  ╚═══╝  ╚═╝╚═╝     ╚═╝"
              " "
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
                desc = "Find text";
                key = "t";
                action = "Telescope live_grep";
              }
              {
                icon = " ";
                desc = "File tree";
                key = "e";
                action = "NvimTreeToggle";
              }
              {
                icon = "󰊢 ";
                desc = "Lazy git";
                key = "g";
                action = "LazyGit";
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
    };

    colorschemes.catppuccin = {
      enable = true;
      settings.flavour = "macchiato";
    };
  };
}
