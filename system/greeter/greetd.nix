{ pkgs, ... }:

{
  programs.dankMaterialShell.greeter = {
    enable = true;
    compositor.name = "niri";   # or "hyprland" if you prefer
    configHome = "/home/gwimbly";  # optionally copies that user's DMS settings (and wallpaper) to greeter's data dir
  };
}

