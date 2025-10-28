  {
  config,
  pkgs,
  inputs,
  ...
}:

{
  environment.systemPackages = with pkgs; [
    wget
    git
    pavucontrol
    pulseaudio
    arrpc
    nodePackages.prettier
    xwayland
    ffmpeg
    mesa
    libva
    libva-utils
    playerctl
    nh
    base16-schemes
    ddcutil
  ];
  }
