{
  config,
  pkgs,
  inputs,
  lib,
  ...
}:
{
  environment.systemPackages = with pkgs; [

    fastfetch
    cava
    pipes-rs
    unimatrix
    rsclock
    lolcat
    # steam-tui
  ];
}
