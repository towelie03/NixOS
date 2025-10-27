{ config, pkgs, inputs, system, lib, uname, ... }:

let
  _base00 = builtins.trace "Stylix base00: ${config.lib.stylix.colors.base00}" null;
in
{
  imports = [
    inputs.home-manager.nixosModules.default
  ];

  ########################################
  ## Nix settings
  ########################################
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  nixpkgs.config = {
    allowUnfree = true;
    allowUnsupportedSystem = true;
  };

  ########################################
  ## User + Shell
  ########################################
  users.defaultUserShell = pkgs.fish;
  programs.fish.enable = true;

  users.users.${uname} = {
    isNormalUser = true;
    description = "Gwimbly";
    extraGroups = [ "wheel" "networkmanager" "audio" "video" ];
    shell = pkgs.fish;
  };

  ########################################
  ## Time + Locale
  ########################################
  time.timeZone = "America/Vancouver";

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

  ########################################
  ## Services
  ########################################
  services = {
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      wireplumber.enable = true;
      media-session.enable = false;
    };

    flatpak.enable = true;
    blueman.enable = true;
    printing.enable = true;

    systemd.services.flatpak-repo = {
      wantedBy = [ "multi-user.target" ];
      path = [ pkgs.flatpak ];
      script = ''
        flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
      '';
    };
  };

  ########################################
  ## Security
  ########################################
  security = {
    doas = {
      enable = true;
      wheelNeedsPassword = false;
    };
    sudo.enable = false;
    rtkit.enable = true;
  };

  ########################################
  ## Fonts
  ########################################
  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    roboto
    source-sans
    font-awesome
    openmoji-color
  ];

  ########################################
  ## Programs
  ########################################
  programs = {
    nh = {
      enable = true;
      clean.enable = true;
      clean.extraArgs = "--keep-since 14d --keep 7";
      flake = "/home/${uname}/.config/nixos";
    };

    steam = {
      enable = true;
      extraCompatPackages = [ pkgs.proton-ge-bin ];
      gamescopeSession.enable = true;
    };

    gtk = {
      enable = true;
      theme = {
        name = "adw-gtk3";
        package = pkgs.adw-gtk3;
      };
    };

    qt = {
      enable = true;
      platformTheme = "gtk";
      style = "adwaita-dark";
    };

    gamemode.enable = true;
  };

  ########################################
  ## Hardware + Environment
  ########################################
  hardware.bluetooth.enable = true;

  environment = {
    sessionVariables = {
      NIXOS_OZONE_WL = "1";
      STEAM_EXTRA_COMPAT_TOOLS_PATHS = "~/.steam/root/compatibilitytools.d/";
      GTK_THEME = "adw-gtk3";
      XDG_SESSION_TYPE = "wayland";
    };

    variables = {
      EDITOR = "nvim";
      SUDO_EDITOR = "nvim";
      terminal = "ghostty";
      browser = "brave";
    };
  };

  ########################################
  ## Networking
  ########################################
  networking = {
    networkmanager.enable = true;
    firewall.enable = true;
  };

  ########################################
  ## System Packages
  ########################################
  environment.systemPackages = with pkgs; [
    neovim
    git
    wget
    curl
    fzf
    lsd
    ripgrep
    bat
    eza
    btop
    superfile

    # File manager
    thunar
    thunar-gtk3

    # Networking & containers
    docker
    docker-compose
    wireshark
    nmap
  ];

  ########################################
  ## Kernel Tweaks
  ########################################
  boot.kernel.sysctl = {
    "fs.file-max" = 524288;
  };
}

