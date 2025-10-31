{ config, lib, pkgs, ... }:
{
  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;

    # Basic options
    opts = {
      updatetime = 100; # Faster completion
      number = true;
      relativenumber = true;
      shiftwidth = 2;
      tabstop = 2;
      expandtab = true;
      smartindent = true;
      autoindent = true;
      wrap = false;
      swapfile = false;
      termguicolors = true;
      undofile = true;
      ignorecase = true;
      incsearch = true;
      smartcase = true;
    };
    
    # Plugins
    plugins = {
      lualine.enable = true;
      web-devicons.enable = true;

      nvim-tree = {
        enable = true;
        settings = {
          disable_netrw = true;
          hijack_netrw = true;

          update_focused_file.enable = true;

          view = {
            width = 30;
            side = "left";
          };

          renderer = {
            highlight_git = true;
            icons = {
              show = {
                file = true;
                folder = true;
              };
            };
          };
        };
      };

      telescope.enable = true;
      treesitter.enable = true;

      presence = {
        enable = true;
        settings = {
          enable_line_number = true;
          auto_update = true;
        };
      };

      cmp.enable = true;
      comment.enable = true;

      vim-surround.enable = true;
      fugitive.enable = true;

      # LSP plugin and servers
      lsp = {
        enable = true;
        servers = {
          lua_ls = {};
          pyright = {};
          ts_ls = {};
          nil_ls = {
            enable = true;
            settings = {
              formatting.command = [ "nixpkgs-fmt" ];
            };
          };
        };
      };
    };

    globals = {
      mapleader = " ";      # Use space as leader
      maplocalleader = " "; # Optional
    };

    # Key mappings
    keymaps = [
      {
        key = "<leader>ff";
        action = "<cmd>Telescope find_files<cr>";
        options.desc = "Find files";
      }
      {
        key = "<leader>fg";
        action = "<cmd>Telescope live_grep<cr>";
        options.desc = "Live grep";
      }
      {
        key = "<C-n>";
        action = "<CMD>NvimTreeToggle<CR>";
        options.desc = "Toggle NvimTree";
      }
      {
        key = "<Ctrl>w";
        action = "<cmd>NvimTreeFindFile<cr>";
        options.desc = "Find current file in explorer";
      }
    ];
  };
}

