{ config, pkgs, inputs, self, ... }:

let
  allPackages = import ./packages.nix { inherit pkgs; };
in
{
  home.username = "gwimbly";
  home.homeDirectory = "/home/gwimbly";

  imports = [
    ../../home/niri/default.nix
    ../../home/quickshell/quickshell.nix

    ../../home/editors/vscode.nix
    ../../home/editors/nixvim.nix

    ../../home/programs/ghostty.nix
    ../../home/programs/fastfetch.nix
    ../../home/programs/obs.nix
    ../../home/programs/vesktop/default.nix
    ../../home/programs/brave.nix

    ../../system/shell/fish.nix
    
    inputs.dankMaterialShell.homeModules.niri
    inputs.dankMaterialShell.nixosModules.greeter
    inputs.nixvim.homeManagerModules.nixvim
  ];

  home.packages = allPackages;

  xdg.portal.enable = true;
  home.stateVersion = "24.11";

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  services.cliphist = {
    enable = true;
    allowImages = true;
  };

  programs.home-manager.enable = true;
}
