{ config, pkgs, lib, self, ... }:
{
  stylix.enable = true;
  stylix.autoEnable = true;
  stylix.opacity.terminal = 0.8;
  stylix.targets.nixcord.enable = false;
  stylix.targets.nixos-icons.enable = true;
  #stylix.base16Scheme = toString (builtins.path {
    #path = ../../assets/themes/base-16/tokyo-night-dark.yaml;
  #});
  
  stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/tokyodark-terminal.yaml";
  stylix.enableReleaseChecks = false;
  stylix.fonts = {
    serif = {
      package = pkgs.nerd-fonts.ubuntu;
      name = "Ubuntu Nerd Font";
    };

    sansSerif = {
      package = pkgs.nerd-fonts.ubuntu;
      name = "Ubuntu Nerd Font";
    };

    monospace = {
      package = pkgs.nerd-fonts.jetbrains-mono;
      name = "JetBrainsMono Nerd Font";
    };  
  };
}
