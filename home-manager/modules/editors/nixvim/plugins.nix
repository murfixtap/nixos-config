{
  inputs,
  user,
  flakePath,
  ...
}: {
  programs.nixvim = {
    plugins = {
      nvim-autopairs.enable = true;
      cmp-autopairs.enable = true;
      rainbow-delimiters.enable = true;

      treesitter = {
        enable = true;
        settings = {
          ensure_installed = [
            "nix"
            "python"
            "rust"
            "html"
            "css"
            "scss"
            "javascript"
            "jsx"
            "typescript"
            "tsx"
            "toml"
            "lua"
          ];
          highlight.enable = true;
        };
      };

      lsp = {
        enable = true;
        servers = {
          # Python
          basedpyright = {
            enable = true;
            settings.basedpyright.analysis = {
              typeCheckingMode = "basic";
              diagnosticMode = "workspace";
              autoImportCompletions = true;
              useLibraryCodeForTypes = true;
            };
          };
          ruff.enable = true;
          # Nix
          nixd = {
            enable = true;
            settings = {
              formatting.command = ["alejandra"];
              nixpkgs.expr = "import ${inputs.nixpkgs} { }";
              options = {
                nixos.expr = "(builtins.getFlake \"${flakePath}\").nixosConfigurations.luna.options";
                home-manager.expr = "(builtins.getFlake \"${flakePath}\").nixosConfigurations.luna.options.home-manager.users.${user}.type.getSubOptions [ ]";
              };
            };
          };
          # Rust
          rust_analyzer = {
            enable = true;
            installCargo = true;
            installRustc = true;
          };
          # Frontend
          html.enable = true;
          cssls.enable = true;
          ts_ls.enable = true;
          tailwindcss.enable = true;
        };
      };

      cmp = {
        enable = true;
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

      conform-nvim = {
        enable = true;
        settings = {
          format_on_save = {
            lsp_fallback = true;
            timeout_ms = 500;
          };
          formatters_by_ft = {
            nix = ["alejandra"];
            python = ["ruff_format"];
            rust = ["rustfmt"];
            lua = ["stylua"];
            toml = ["taplo"];
            # ---
            javascript = ["prettier"];
            typescript = ["prettier"];
            javascriptreact = ["prettier"];
            typescriptreact = ["prettier"];
            html = ["prettier"];
            css = ["prettier"];
            scss = ["prettier"];
            json = ["prettier"];
            yaml = ["prettier"];
            markdown = ["prettier"];
          };
        };
      };

      none-ls = {
        enable = true;
        sources = {
          diagnostics = {
            eslint_d.enable = true;
            stylelint.enable = true;
          };
          code_actions = {
            eslint_d.enable = true;
            stylelint.enable = true;
          };
        };
      };

      # UI components
      telescope.enable = true;
      nvim-tree.enable = true;
      lazygit.enable = true;

      gitsigns = {
        enable = true;
        settings = {
          attach_to_untracked = true;
          current_line_blame = true;
        };
      };

      toggleterm = {
        enable = true;
        settings.direction = "float";
        float_opts.border = "curved"; # Borders: "single", "double", "shadow", "curved"
      };
    };
  };
}
