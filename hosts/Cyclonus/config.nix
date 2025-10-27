{ config, pkgs, inputs, system, username, ... }:

{
  imports = [
    ./../config-shared.nix
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
        user = username;
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

  ## CPU microcode (Intel)
  hardware.cpu.intel.updateMicrocode = true;

  ## User
  users.users.${username} = {
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
    extraSpecialArgs = { inherit inputs system username; };
    users.${username} = import ./home.nix;
  };

  ## Security
  security.sudo.enable = false;
  security.doas = {
    enable = true;
    wheelNeedsPassword = false;
    extraRules = [
      {
        users = [ username ];
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
