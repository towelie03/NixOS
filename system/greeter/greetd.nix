{
  config,
  pkgs,
  inputs,
  ...
}:
{
  programs.dankMaterialShell.greeter = {
    enable = true;
    compositor.name = "niri";   # Greeter runs under Niri
    configHome = "/home/gwimbly";  # Replace with your username
  };

  services.greetd = {
    enable = true;

    settings = {
      # TTY where greetd appears
      terminal.vt = 1;

      default_session = {
        user = "greeter";
        command = "${pkgs.dms-cli}/bin/dms-greeter --command niri";
      };
    };
  };

  # Required to prevent shutdown hang & ensure TTY works properly
  systemd.services.greetd.serviceConfig = {
    Type = "idle";
    StandardInput = "tty";
    StandardOutput = "tty";
    StandardError = "journal";
    TTYReset = true;
    TTYVHangup = true;
    TTYVTDisallocate = true;
  };
}

