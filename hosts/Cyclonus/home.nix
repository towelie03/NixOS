{ config, inputs, pkgs, uname, system, ... }:

{
  imports = [
    ./../home-shared.nix
  ];

  ########################################
  ## Hyprland / Niri-specific environment
  ########################################
  wayland.windowManager.hyprland.settings = {
    env = [
      "ELECTRON_OZONE_PLATFORM_HINT=auto"
      "GDK_SCALE=1"
      "QT_QPA_PLATFORMTHEME=gtk3"
      "QT_QPA_PLATFORMTHEME_QT6=gtk3"
    ];
  };
}

