{ pkgs, ... }:

with pkgs;
[
  mesa
  xdg-desktop-portal-gnome
  xdg-desktop-portal-gtk
  # optional for wlr-specific portal, useful on Wayland:
  xdg-desktop-portal-wlr
  tlp          # Advanced power management
  acpi         # ACPI info and battery stats
  lm_sensors   # Monitor temperatures
  power-profiles-daemon

  # Gaming
  #winetricks
  #protontricks
  #protonup
  #protonup-rs
  #protonup-qt
  #protonplus
  #lutris
  #bottles
  #mangohud
  #steamcmd
  steam
  #openrgb-with-all-plugins
  file-roller
  obsidian
  xfce.thunar
  adw-gtk3
  font-manager
  # music
  feishin

  # TUI
  btop

  # Desktop
  nwg-look

  # Development
  rustup
  gcc
  gh
  nixfmt-rfc-style
  nixpkgs-fmt
  black

  # Utilities
  jq
  socat
  tree
  libnotify
  wl-clipboard
  cliphist
  pywalfox-native
  wallust
  imagemagick
  rar
  unzip
  p7zip
  mpv
  cava
  brightnessctl
  lazygit
  superfile
  fzf
  git
  wget
  curl
  lsd
  ripgrep
  bat
  starship
  less
  zoxide
  fd

  # Networking & containers
  tailscale
  docker
  docker-compose
  wireshark
  nmap

  # Quickshell stuff
  qt6Packages.qt5compat
  libsForQt5.qt5.qtgraphicaleffects
  kdePackages.qtbase
  kdePackages.qtdeclarative

  # Niri
  xwayland-satellite
]

