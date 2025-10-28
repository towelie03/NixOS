{ config, pkgs, ... }:

{
  services.greetd = {
    enable = true;

    settings = {
      terminal.vt = 1;

      default_session = {
        user = "Cyclonus";
        command = "${pkgs.niri}/bin/niri-session";
      };
    };
  };

  # Fix TTY reset issues
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

