{ pkgs }:
{
  browser = "${pkgs.brave}/bin/brave";
  terminal = "${pkgs.ghostty}/bin/ghostty";
  fileManager = "${pkgs.xfce.thunar}/bin/thunar";
}
