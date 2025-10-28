{ config, pkgs, inputs, lib, self, ... }:

{
  imports = [
    ./hardware-configuration.nix
    inputs.home-manager.nixosModules.default
    inputs.dankMaterialShell.nixosModules.greeter
    #"${self}/system/greeter/greetd.nix"
    "${self}/system/programs/steam.nix"
    "${self}/system/programs/lact.nix"
    "${self}/system/programs/stylix.nix"
    "${self}/system/xdg.nix"
    "${self}/system/environment.nix"
    "${self}/system/packages.nix"
  ];

  nixpkgs.overlays = [
    (final: prev: {
      nur = import inputs.nur {
        nurpkgs = prev;
        pkgs = prev;
      };
    })
  ];

  users.groups.i2c = {};

  users.users.Cyclonus = {
    isNormalUser = true;
    description = "Cyclonus";
    shell = pkgs.fish;
    extraGroups = [ "wheel" "networkmanager" "audio" "video" "input" "plugdev" "bluetooth" "i2c" ];
  };
  
  security.sudo.enable = false;
  security.doas = {
    enable = true;
    wheelNeedsPassword = false;
    extraRules = [
      {
        users = [ "Cyclonus" ];
        keepEnv = true;
        persist = true;
      }
    ];
  };

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = { inherit inputs; };
    users = {
      "Cyclonus" = import ./home.nix;
    };
  };
  
  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    nerd-fonts._0xproto
    nerd-fonts.droid-sans-mono
    noto-fonts
    noto-fonts-emoji
    noto-fonts-cjk-sans
    noto-fonts-cjk-serif
    material-symbols
    material-icons
    roboto
    fira-sans
  ];

  boot = {
    loader.systemd-boot.enable = true;
    loader.efi.canTouchEfiVariables = true;
    kernelPackages = pkgs.linuxPackages_zen;
    kernelModules = [ "i2c-dev" ];
    initrd.availableKernelModules = [ "i2c-dev" ];
  };
  
  programs.dankMaterialShell.greeter = {
      enable = true;
      compositor.name = "niri";
      configHome = "/home/Cyclonus";
  };


  services.udev.packages = [ pkgs.rwedid ];

  nix.settings = {
    experimental-features = [ "nix-command" "flakes" ];
    auto-optimise-store = true;
  };

  environment.shellAliases = {
    sudo = "doas";
  };

  nix.gc = {
    automatic = true;
    dates = "daily";
    options = "--delete-older-than 5d";
  };

  networking = {
    hostName = "Cyclonus";
    wireless.enable = false;
    wireless.userControlled.enable = false;

    networkmanager = {
      enable = true;
      wifi.backend = "wpa_supplicant";
      wifi.powersave = false;
    };
  };

  hardware.enableRedistributableFirmware = true;

  i18n = {
    defaultLocale = "en_US.UTF-8";
    supportedLocales = [ "en_US.UTF-8" "ja_JP.UTF-8" ];
    extraLocaleSettings = {
      LC_ADDRESS = "en_US.UTF-8";
      LC_IDENTIFICATION = "en_US.UTF-8";
      LC_MEASUREMENT = "en_US.UTF-8";
      LC_MONETARY = "en_US.UTF-8";
      LC_NAME = "en_US.UTF-8";
      LC_NUMERIC = "en_US.UTF-8";
      LC_PAPER = "en_US.UTF-8";
      LC_TELEPHONE = "en_US.UTF-8";
      LC_TIME = "en_US.UTF-8";
    };
  };

  programs.fish.enable = true;

  services = {
    greetd.enable = true;
    greetd.settings.default_session = {
      command = "${pkgs.niri}/bin/niri-session";
      user = "Cyclonus";
    };

    pipewire.enable = true;
    pipewire.alsa.enable = true;
    pipewire.alsa.support32Bit = true;
    pipewire.pulse.enable = true;
    pipewire.wireplumber.enable = true;
    pipewire.media-session.enable = false;

    dbus.enable = true;
    dbus.packages = with pkgs; [ bluez ];

    xserver.enable = false; # wayland-only
    power-profiles-daemon.enable = true;
    printing.enable = true;
    gvfs.enable = true;
    tumbler.enable = true;

  };

  xdg.portal.enable = true;

  hardware.bluetooth.enable = true;
  
  environment.systemPackages = with pkgs; [ bluez ];

  nixpkgs.config.allowUnfree = true;
  
  home-manager.backupFileExtension = "backup";

  system.stateVersion = "25.05";

  system.activationScripts.logRebuildTime = {
    text = ''
      LOG_FILE="/var/log/nixos-rebuild-log.json"
      TIMESTAMP=$(date "+%d/%m")
      GENERATION=$(readlink /nix/var/nix/profiles/system | grep -o '[0-9]\+')

      echo "{\"last_rebuild\": \"$TIMESTAMP\", \"generation\": $GENERATION}" > "$LOG_FILE"
      chmod 644 "$LOG_FILE"
    '';
  };
}
