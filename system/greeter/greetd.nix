{
  config,
  pkgs,
  inputs,
  ...
}:

{
  programs.dankMaterialShell.greeter = {
    enable = true;
    compositor.name = "niri";  # Choose between: "niri" | "hyprland"
    configHome = "/home/gwimbly"; # optional
  };

  services.greetd = {
    enable = true;

    settings = {
      default_session = {
        user = "greeter";
        # Launch the DankMaterialShell greeter session
        command = ''
          ${pkgs.dms-cli}/bin/dms-greeter --compositor niri
        '';
      };
    };
  };

  systemd = {
    extraConfig = "DefaultTimeoutStopSec=10s";
    services.greetd.serviceConfig = {
      Type = "idle";
      StandardInput = "tty";
      StandardOutput = "tty";
      StandardError = "journal";
      TTYReset = true;
      TTYVHangup = true;
      TTYVTDisallocate = true;
    };
  };
}

