{ config, pkgs, ... }:

{
  programs.alacritty = {
    enable = true;

    settings = {
      general = {
        live_config_reload = true;
      };

      colors = {
        draw_bold_text_with_bright_colors = true;
      };

      cursor = {
        style = {
          blinking = "On";
          shape = "Block";
        };
      };

      env = {
        TERM = "xterm-256color";
      };

      scrolling = {
        history = 5000;
      };

      selection = {
        save_to_clipboard = true;
        semantic_escape_chars = ",│`|:\"' ()[]{}<>\t";
      };

      window = {
        dynamic_padding = true;
        dynamic_title = true;
        #opacity = 0.65;
        decorations_theme_variant = "Dark";

        dimensions = {
          columns = 150;
          lines = 40;
        };
      };
    };
  };
}

