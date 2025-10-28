{ lib, config, pkgs, ... }:

let
  apps = import ./applications.nix { inherit pkgs; };

in {
  programs.niri.settings.binds = with config.lib.niri.actions; {

    # Show Niri’s built-in hotkey overlay
    "super+Shift+Slash".action = show-hotkey-overlay;

    # Terminals
    "control+Return".action = spawn apps.alacritty;
    "control+shift+Return".action = spawn apps.kitty;

    # Apps
    "super+b".action = spawn apps.browser;
    "super+e".action = spawn apps.fileManager;

    # Window management
    "super+o".action = toggle-overview;
    "super+q".action = close-window;

    # Workspaces
    "super+1".action = focus-workspace 1;
    "super+2".action = focus-workspace 2;
    "super+3".action = focus-workspace 3;
    "super+4".action = focus-workspace 4;
    "super+5".action = focus-workspace 5;
    "super+6".action = focus-workspace 6;
    "super+7".action = focus-workspace 7;
    "super+8".action = focus-workspace 8;
    "super+9".action = focus-workspace 9;

    "super+shift+1".action = move-column-to-workspace 1;
    "super+shift+2".action = move-column-to-workspace 2;
    "super+shift+3".action = move-column-to-workspace 3;
    "super+shift+4".action = move-column-to-workspace 4;
    "super+shift+5".action = move-column-to-workspace 5;
    "super+shift+6".action = move-column-to-workspace 6;
    "super+shift+7".action = move-column-to-workspace 7;
    "super+shift+8".action = move-column-to-workspace 8;
    "super+shift+9".action = move-column-to-workspace 9;

    # Column focus/movement
    "super+j".action = focus-column-left;
    "super+l".action = focus-column-right;
    "super+shift+j".action = move-column-left;
    "super+shift+l".action = move-column-right;

    # Window focus/movement
    "super+k".action = focus-window-or-workspace-down;
    "super+i".action = focus-window-or-workspace-up;
    "super+shift+k".action = move-window-down-or-to-workspace-down;
    "super+shift+i".action = move-window-up-or-to-workspace-up;

    # Column/window sizing
    "super+alt+j".action = set-column-width "-10%";
    "super+alt+l".action = set-column-width "+10%";
    "super+alt+i".action = set-window-height "-10%";
    "super+alt+k".action = set-window-height "+10%";

    # Column display/mode toggles
    "super+f".action = maximize-column;
    "super+shift+f".action = fullscreen-window;
    "super+control+f".action = expand-column-to-available-width;
    "super+shift+c".action = center-column;
    "super+ctrl+c".action = center-visible-columns;
    "super+t".action = toggle-window-floating;
    "super+shift+t".action = switch-focus-between-floating-and-tiling;
    "super+w".action = toggle-column-tabbed-display;

    # Screenshots
    "super+shift+print".action = screenshot;
    #"control+print".action = screenshot-screen;
    #"alt+print".action = screenshot-window; # optional
  };
}
