{ pkgs, ... }:

{
  home.packages = with pkgs; [
    ghostty
  ];

  home.file = {
    ".config/ghostty/config" = {
      text = ''
        copy-on-select = true
        confirm-close-surface = false
        gtk-titlebar = false
        window-padding-x = 10
        window-padding-y = 10
        background-opacity = 0.8
        font-size = 14
      '';
    };
  };
}

