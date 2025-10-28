{ lib, pkgs, ... }:

{
  programs.niri.settings.spawn-at-startup = [
    # Clipboard manager (stores clipboard history)
    { command = [ "bash" "-c" "wl-paste --watch cliphist store &" ]; }
    # DankShell startup (core shell integration)
    { command = [ "dms" "run" ]; }
    { command = [ "xwayland-satellite" ]; }
    { command = [ "systemctl" "--user" "start" "hyprpolkitagent" ]; }

    # Optional: you can include other utilities here as needed
    # Example: system components or Wayland daemons
    # { command = [ "systemctl" "--user" "start" "hyprpolkitagent" ]; }
    # { command = [ "xwayland-satellite" ]; }
    # { command = [ "arrpc" ]; }
    # { command = [ "vesktop" ]; }
    # { command = [ "qs" ]; }
    # { command = [ "swww-daemon" ]; }
  ];
}

