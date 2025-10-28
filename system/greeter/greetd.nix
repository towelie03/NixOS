{
  config,
  pkgs,
  inputs,
  ...
}: {
  programs.dankMaterialShell.greeter = {
    enable = true;
    compositor.name = "niri"; 
    configHome = "/home/gwimbly";  
  };

  services.greetd = {
    enable = true;

    settings = {
      terminal.vt = 1;

      default_session = {
        user = "greeter";
        command =
          "${inputs.dankMaterialShell.packages.${pkgs.system}.greeter}/bin/dms-greeter";
      };
    };
  };

  # ✅ stop shutdown hang + proper TTY + login session
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

