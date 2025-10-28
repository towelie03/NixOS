{ pkgs }:
{
  browser = "${pkgs.brave}/bin/brave";
  ghostty = "${pkgs.ghostty}/bin/ghostty";
  alacritty = "${pkgs.ghostty}/bin/alacritty";
  fileManager = "${pkgs.xfce.thunar}/bin/thunar";
}
