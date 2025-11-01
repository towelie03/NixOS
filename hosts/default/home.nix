{ config, pkgs, inputs, self, ... }:

let
  allPackages = import ./packages.nix { inherit pkgs; };
  inherit (pkgs.stdenv.hostPlatform) system;
  nixvim-package = inputs.nixvim-config.packages.${system}.default;
  extended-nixvim = nixvim-package.extend config.stylix.targets.nixvim.exportedModule;
in
{
  home.username = "gwimbly";
  home.homeDirectory = "/home/gwimbly";
  nixpkgs.config.allowUnfree = true;
  imports = [
    inputs.niri.homeModules.niri
    inputs.stylix.homeModules.stylix
    inputs.dankMaterialShell.homeModules.dankMaterialShell.default
    inputs.dankMaterialShell.homeModules.dankMaterialShell.niri
    ../../stylix/stylix.nix
    ../../home/apps/fish/fish.nix
    ../../home/niri/niri.nix
    ../../home/apps/nixcord.nix
    ../../home/editors/nixvim.nix
    ../../home/apps/alacritty.nix
    ../../home/apps/git.nix
    ../../home/apps/ghostty.nix
    ../../home/apps/fastfetch.nix
    ../../home/apps/obs.nix
    ../../home/apps/brave.nix
    ../../home/apps/lazygit.nix
    ../../home/apps/btop.nix
    ../../home/apps/superfile.nix
    ../../home/apps/starship/starship.nix

    inputs.nixvim.homeModules.nixvim
    inputs.nixcord.homeModules.nixcord

  ];

  home.packages = allPackages;

  xdg = {
    portal.enable = true;
    portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
    };

  home.stateVersion = "25.05";

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  services.cliphist = {
    enable = true;
    allowImages = true;
  };

  programs.home-manager.enable = true;
  programs.dankMaterialShell.enable = true;
  programs.dankMaterialShell.enableSystemd = true;
  programs.zoxide.enable = true;
  programs.zoxide.enableFishIntegration = true;
  programs.fzf.enable = true;
  programs.fzf.enableFishIntegration = true;
  programs.nixvim.extraPackages = with pkgs; [ wl-clipboard ];
  programs.nixvim.opts.clipboard = [ "unnamedplus" ];
}

