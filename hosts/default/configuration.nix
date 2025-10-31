{ config, pkgs, inputs, lib, self, ... }:
{
  imports = [
    ./hardware-configuration.nix
    inputs.home-manager.nixosModules.default
    inputs.dankMaterialShell.nixosModules.greeter
    #"${self}/system/greeter/greeter.nix"
    "${self}/system/programs/steam.nix"
    "${self}/system/programs/lact.nix"
    "${self}/system/environment.nix"
    "${self}/system/packages.nix"
  ];

  time.timeZone = "America/Vancouver";
  nixpkgs.config.allowUnfree = true;
  nixpkgs.overlays = [
    (final: prev: {
      nur = import inputs.nur {
        nurpkgs = prev;
        pkgs = prev;
      };
    })
  ];

  users.groups.i2c = {};
  users.groups.wireshark = {};

  users.users.gwimbly = {
    isNormalUser = true;
    description = "gwimbly";
    shell = pkgs.fish;
    extraGroups = [ "wheel" "networkmanager" "audio" "video" "input" "plugdev" "bluetooth" "i2c" "wireshark" ];
  };

  #services.greetd.enable = true;
  #services.greetd.settings.default_session.user = "gwimbly";

  security.sudo.enable = false;
  security.doas = {
    enable = true;
    wheelNeedsPassword = false;
    extraRules = [
      {
        users = [ "gwimbly" ];
        keepEnv = true;
        persist = true;
      }
    ];
  };

  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users = {
      "gwimbly" = import ./home.nix;
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
    nerd-fonts.ubuntu
    nerd-fonts.mononoki 
    nerd-fonts.fira-code
    nerd-fonts.roboto-mono
  ];

  boot = {
    loader.systemd-boot.enable = true;
    loader.efi.canTouchEfiVariables = true;
    kernelPackages = pkgs.linuxPackages_zen;
    kernelModules = [ "i2c-dev" ];
    initrd.availableKernelModules = [ "i2c-dev" ];
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
  programs.wireshark = {
    enable          = true;
    usbmon.enable   = true;
  };
  programs.dconf.enable = true;

  services = {
    pipewire.enable = true;
    pipewire.alsa.enable = true;
    pipewire.alsa.support32Bit = true;
    pipewire.pulse.enable = true;
    pipewire.wireplumber.enable = true;

    openssh.enable = true;
    openssh.permitRootLogin = "no";
    openssh.passwordAuthentication = true;

    tailscale.enable = true;
    tailscale.useRoutingFeatures = "client";

    dbus.enable = true;
    dbus.packages = with pkgs; [ bluez ];

    xserver.enable = false; # Wayland-only
    power-profiles-daemon.enable = true;
    upower.enable = true;

    printing.enable = true;
    gvfs.enable = true;
    tumbler.enable = true;
  };

  hardware.bluetooth.enable = true;

  # <- IMPORTANT: add portal packages here so they are present in the system profile
  environment.systemPackages = with pkgs; [
    bluez
    tlp
    lm_sensors
    openssl
  ];

  home-manager.backupFileExtension = "backup";
  system.stateVersion = "25.05";
}

