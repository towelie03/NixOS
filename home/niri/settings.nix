{ config, pkgs, ... }:

{
  programs.niri = {
    enable = true;
    package = pkgs.niri;

    settings = {
      ## ─────────────────────────────
      ## Workspaces
      ## ─────────────────────────────
      workspaces = {
        "browser" = {};
        "vesktop" = {};
        "chat" = {};
        "music" = {};
      };

      ## ─────────────────────────────
      ## General Settings
      ## ─────────────────────────────
      prefer-no-csd = true;

      hotkey-overlay = {
        skip-at-startup = true;
      };

      screenshot-path = "~/Pictures/Screenshots/Screenshot from %Y-%m-%d %H-%M-%S.png";

      ## ─────────────────────────────
      ## Layout
      ## ─────────────────────────────
      layout = {
        gaps = 8;
        background-color = "#00000000";

        # Optional centering / column behavior
        center-focused-column = "never";
        default-column-width = { proportion = 0.5; };

        preset-column-widths = [
          { proportion = 0.33333; }
          { proportion = 0.5; }
          { proportion = 0.66667; }
        ];

        focus-ring = {
          enable = true;
          width = 4;
          active = { color = "#A8AEFF"; };
          inactive = { color = "#505050"; };
        };

        border = {
          enable = false;
          urgent-color = "#9b0000";
        };

        shadow = {
          enable = true;
          softness = 30;
          spread = 5;
          offset = { x = 0; y = 5; };
          color = "#0007";
        };
      };

      ## ─────────────────────────────
      ## Input
      ## ─────────────────────────────
      input = {
        focus-follows-mouse.enable = true;
        warp-mouse-to-focus.enable = false;

        keyboard = {
          repeat-delay = 300;
          repeat-rate = 50;
          xkb.layout = "us";
        };

        touchpad = {
          tap = true;
          click-method = "button-areas";
          natural-scroll = true;
          scroll-method = "two-finger";
          dwt = true;
          dwtp = true;
          tap-button-map = "left-right-middle";
          middle-emulation = true;
          accel-profile = "adaptive";
        };

        mouse = {};
        trackpoint = {};
      };

      ## ─────────────────────────────
      ## Outputs
      ## ─────────────────────────────
      outputs = {
        "eDP-1" = {
          mode = {
            width = 1920;
            height = 1080;
            refresh = 120.030;
          };
          scale = 1.0;
        };
      };

      ## ─────────────────────────────
      ## Cursor
      ## ─────────────────────────────
      cursor = {
        size = 24;
        theme = "Adwaita";
      };

      ## ─────────────────────────────
      ## Environment Variables
      ## ─────────────────────────────
      environment = {
        CLUTTER_BACKEND = "wayland";
        GDK_BACKEND = "wayland,x11";
        MOZ_ENABLE_WAYLAND = "1";
        NIXOS_OZONE_WL = "1";
        QT_QPA_PLATFORM = "wayland";
        QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
        ELECTRON_OZONE_PLATFORM_HINT = "auto";
        GDK_SCALE = "1";
        QT_QPA_PLATFORMTHEME = "gtk3";
        QT_QPA_PLATFORMTHEME_QT6 = "gtk3";

        XDG_SESSION_TYPE = "wayland";
        XDG_CURRENT_DESKTOP = "niri";
      };

      ## ─────────────────────────────
      ## Animations
      ## ─────────────────────────────
      animations = {
        # Uncomment to disable all animations:
        # enable = false;
        slowdown = 1.0;
      };

      ## ─────────────────────────────
      ## Overview Appearance
      ## ─────────────────────────────
      overview = {
        backdrop-color = "#0E0825";
      };

      ## ─────────────────────────────
      ## Debugging
      ## ─────────────────────────────
      debug = {
        honor-xdg-activation-with-invalid-serial = true;
      };
    };
  };
}

