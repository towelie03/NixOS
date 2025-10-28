{
  description = "NixOS config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixvim.url = "github:nix-community/nixvim";
    home-manager.url = "github:nix-community/home-manager";
    nur.url = "github:nix-community/NUR";
    chaotic.url = "github:chaotic-cx/nyx/nyxpkgs-unstable";

    matugen.url = "github:InioX/matugen";

    stylix = {
      url = "github:danth/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    dgop = {
      url = "github:AvengeMedia/dgop";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    dms-cli = {
      url = "github:AvengeMedia/danklinux";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    dankMaterialShell = {
      url = "github:AvengeMedia/DankMaterialShell";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.dgop.follows = "dgop";
      inputs.dms-cli.follows = "dms-cli";
    };

    quickshell = {
      url = "git+https://git.outfoxxed.me/outfoxxed/quickshell";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    niri = {
      url = "github:sodiboo/niri-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

 outputs = { self, nixpkgs, home-manager, chaotic, nixvim, nur, stylix, quickshell, niri, dankMaterialShell, ... }@inputs:
{
  nixosConfigurations.default = nixpkgs.lib.nixosSystem {
    system = "x86_64-linux";
    specialArgs = { inherit self inputs; };
    modules = [
      ./hosts/default/configuration.nix
      inputs.stylix.nixosModules.stylix
      inputs.home-manager.nixosModules.default
      #chaotic.nixosModules.default   
      inputs.dankMaterialShell.homeModules.dankMaterialShell.default
      inputs.dankMaterialShell.homeModules.dankMaterialShell.niri
      inputs.dankMaterialShell.nixosModules.greeter

      ({ pkgs, ... }: {
        environment.systemPackages = [
          (quickshell.packages.${pkgs.system}.default.override {
            withJemalloc = true;
            withQtSvg = true;
            withWayland = true;
            withPipewire = true;
            withPam = true;
            withHyprland = false;
            withNiri = true;
          })
        ];
      })
    ];
  };
};
