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
    nodePackages.prettier
    xwayland
    ffmpeg
    typst 
  ];
  }
