{ pkgs, ... }:

with pkgs;
[
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
  steam
  openrgb-with-all-plugins
  thunar
  file-roller
  obsidian
  thunar-gtk3
  adw-gtk3

  # Terminal
  #ghostty
  #alacritty

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
  superfile
  fzf
  git
  wget
  curl
  lsd
  ripgrep
  bat
  eza
  starship

  # Networking & containers
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

