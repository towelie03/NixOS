{ lib, config, pkgs, ... }:

let
  apps = import ./applications.nix { inherit pkgs; };

in 
{
  programs.niri.settings.binds = {
    # Show Niri’s built-in hotkey overlay
    "Mod+Shift+Slash" = { show-hotkey-overlay = true; };

    # Terminals
    "Ctrl+Return" = { spawn = [ "alacritty" ]; hotkey-overlay-title = "Open a Terminal: alacritty"; };
    "Ctrl+Shift+Return" = { spawn = [ "kitty" ]; hotkey-overlay-title = "Open a Terminal: kitty"; };

    # Apps
    "Mod+B" = { spawn = [ "brave" ]; hotkey-overlay-title = "Open Browser: brave"; };
    "Mod+E" = { spawn = [ "thunar" ]; hotkey-overlay-title = "Open File Manager: thunar"; };

    # Window management
    "Mod+O" = { toggle-overview = true; repeat = false; };
    "Mod+Q" = { close-window = true; };

    # Workspaces
    "Mod+1" = { focus-workspace = 1; };
    "Mod+2" = { focus-workspace = 2; };
    "Mod+3" = { focus-workspace = 3; };
    "Mod+4" = { focus-workspace = 4; };
    "Mod+5" = { focus-workspace = 5; };
    "Mod+6" = { focus-workspace = 6; };
    "Mod+7" = { focus-workspace = 7; };
    "Mod+8" = { focus-workspace = 8; };
    "Mod+9" = { focus-workspace = 9; };

    "Mod+Shift+1" = { move-column-to-workspace = 1; };
    "Mod+Shift+2" = { move-column-to-workspace = 2; };
    "Mod+Shift+3" = { move-column-to-workspace = 3; };
    "Mod+Shift+4" = { move-column-to-workspace = 4; };
    "Mod+Shift+5" = { move-column-to-workspace = 5; };
    "Mod+Shift+6" = { move-column-to-workspace = 6; };
    "Mod+Shift+7" = { move-column-to-workspace = 7; };
    "Mod+Shift+8" = { move-column-to-workspace = 8; };
    "Mod+Shift+9" = { move-column-to-workspace = 9; };

    # Column focus/movement
    "Mod+J" = { focus-column-left = true; };
    "Mod+L" = { focus-column-right = true; };
    "Mod+Shift+J" = { move-column-left = true; };
    "Mod+Shift+L" = { move-column-right = true; };

    # Window focus/movement
    "Mod+K" = { focus-window-or-workspace-down = true; };
    "Mod+I" = { focus-window-or-workspace-up = true; };
    "Mod+Shift+K" = { move-window-down-or-to-workspace-down = true; };
    "Mod+Shift+I" = { move-window-up-or-to-workspace-up = true; };

    # Column/window sizing
    "Mod+Alt+J" = { set-column-width = "-10%"; };
    "Mod+Alt+L" = { set-column-width = "+10%"; };
    "Mod+Alt+I" = { set-window-height = "-10%"; };
    "Mod+Alt+K" = { set-window-height = "+10%"; };

    # Column display/mode toggles
    "Mod+F" = { maximize-column = true; };
    "Mod+Shift+F" = { fullscreen-window = true; };
    "Mod+Ctrl+F" = { expand-column-to-available-width = true; };
    "Mod+Shift+C" = { center-column = true; };
    "Mod+Ctrl+C" = { center-visible-columns = true; };
    "Mod+T" = { toggle-window-floating = true; };
    "Mod+Shift+T" = { switch-focus-between-floating-and-tiling = true; };
    "Mod+W" = { toggle-column-tabbed-display = true; };

    # Screenshots
    #"Mod+Shift+Print" = { screenshot = true; };
    #"Ctrl+Print" = { screenshot-screen = true; };
    #"Alt+Print" = { screenshot-window = true; };
  };
} 
