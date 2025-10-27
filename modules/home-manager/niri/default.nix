{ inputs, pkgs, ... }:
{
  imports = [
    inputs.niri.homeModules.niri
  ];

  home = {
    file.".config/niri/config.kdl".source = ../../../resources/dotfiles/niri/config.kdl;
    packages = with pkgs; [
      xdg-desktop-portal-gtk
      xdg-desktop-portal-gnome
      xwayland-satellite
      qt6.qtwayland
      walker
    ];
    sessionVariables = {
      XDG_SESSION_TYPE = "wayland";
    };
  };
}
