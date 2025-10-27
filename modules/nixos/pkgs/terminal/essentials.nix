{
  config,
  pkgs,
  inputs,
  lib,
  ...
}:

environment.systemPackages = with pkgs; [

  ### Rust / Development Tools
  cargo
  rust-analyzer
  rustup
  rustfmt
  rustc
  gcc
  openssl
  rustls-libssl

  ### Python
  python3
  python3Packages.pip
  python3Packages.virtualenv
  python3Packages.setuptools

  ### Node / JS runtimes
  nodejs
  bun

  ### Terminal Utilities
  lsd
  fzf
  zoxide
  lazygit
  fd
  bat
  tealdeer
  ripgrep
  unzip

  ### Resource / Performance Monitoring
  btop
  htop
  powertop
  nvtopPackages.full

  ### System / Hardware Info
  lshw

  ### Nix Tools
  nixfmt
  nixd
  vulnix
];

