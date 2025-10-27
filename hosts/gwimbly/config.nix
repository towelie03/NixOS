{ config, pkgs, inputs, system, uname, ... }:

let
  # Import shared configuration
  sharedConfig = import ./config-shared.nix { inherit config pkgs inputs system uname; };
in
{
  imports = [
    # Include the results of the hardware scan.
    ./../configuration-shared.nix
    ./hardware-configuration.nix
  ];

  ## Bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  ## Hostname
  networking.hostName = "Cyclonus";

  ## Wayland setup
  services.xserver.enable = false;

  programs.niri = {
    enable = true;
    package = pkgs.niri;
  };

  # Greetd login manager
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.niri}/bin/niri-session";
        user = uname;
      };
    };
  };

  ## Audio + Bluetooth
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    wireplumber.enable = true;
    media-session.enable = false;
  };

  hardware.bluetooth.enable = true;

  ## Power management
  services.power-profiles-daemon.enable = true;
  powerManagement.cpuFreqGovernor = "schedutil";

  ## User
  users.users.${uname} = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "video" "audio" "input" ];
  };

  ## Fonts & theming
  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    roboto
    source-sans
    font-awesome
    openmoji-color
  ];

  ## Home Manager integration
  home-manager = {
    extraSpecialArgs = { inherit inputs system uname; };
    users.${uname} = import ./home.nix; # should include home-shared.nix
  };

  ## Security
  security.sudo.enable = false;
  security.doas = {
    enable = true;
    wheelNeedsPassword = false;
    extraRules = [
      {
        users = [ uname ];
        keepEnv = true;
        persist = true;
      }
    ];
  };

  environment.shellAliases = {
    sudo = "doas";
  };

  ## Environment variables
  environment.sessionVariables = {
    XDG_SESSION_TYPE = "wayland";
    MOZ_ENABLE_WAYLAND = "1";
    QT_QPA_PLATFORM = "wayland";
    GDK_BACKEND = "wayland";
  };
}

