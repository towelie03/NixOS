{ pkgs, config, ... }:

{
  programs.alacritty = {
    enable = true;

    settings = {
      # Font
      font = {
        size = 14;

        normal = {
          family = "JetBrainsMono Nerd Font";
          style = "Regular";
        };

        bold = {
          family = "JetBrainsMono Nerd Font";
          style = "Bold";
        };

        italic = {
          family = "JetBrainsMono Nerd Font";
          style = "Italic";
        };

        bold_italic = {
          family = "JetBrainsMono Nerd Font";
          style = "Bold Italic";
        };
      };

      # Cursor
      cursor = {
        style = {
          blinking = "On";
          shape = "Block";
        };
      };

      # Colors
      colors = {
        draw_bold_text_with_bright_colors = true;
      };

      # Environment
      env = {
        TERM = "xterm-256color";
      };

      # Scrolling
      scrolling = {
        history = 5000;
      };

      # Selection
      selection = {
        save_to_clipboard = true;
        semantic_escape_chars = ",│`|:\"' ()[]{}<>\t";
      };

      # Window
      window = {
        dynamic_padding = true;
        dynamic_title = true;
        opacity = 0.65;
        decorations_theme_variant = "Dark";

        dimensions = {
          columns = 150;
          lines = 40;
        };
      };

      # General
      general = {
        live_config_reload = true;
      };
    };
  };
}

