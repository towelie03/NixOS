{ config, pkgs, inputs, system, uname, ... }:

{
  imports = [
    ../modules/home-manager/fzf.nix
    ../modules/home-manager/niri/default.nix
    ../modules/home-manager/dms/default.nix
  ];

  home.username = ${uname};
  home.homeDirectory = "/home/${uname}";
  home.stateVersion = "24.11";

  home.packages = with pkgs; [
    # Browsers & UI apps
    brave
    obsidian
    gimp
    obs-studio
    base16-schemes

    # Gaming
    winetricks
    protontricks
    protonup
    protonup-rs
    protonup-qt
    protonplus
    lutris
    bottles
    mangohud
    steamcmd
    openrgb-with-all-plugins
    inputs.nvix.packages.${system}.full
    inputs.quickshell.packages.${system}.default

    # File manager plugins
    thunar-archive-plugin
    thunar-media-tags-plugin
    thunar-volman
    thunar-shares-plugin
    thunar-thumbnailer

    # Per-user dev / tools
    kanata
    wallust

    # Misc
    wl-clipboard
    brightnessctl
  ];

  home.sessionVariables = {
    EDITOR = "nvim";
    SUDO_EDITOR = "nvim";
    TERMINAL = "ghostty";
    BROWSER = "brave";
    XDG_SESSION_TYPE = "wayland";
    NIXOS_OZONE_WL = "1";
  };

  programs.home-manager.enable = true;
  programs.fish.enable = true;
}

