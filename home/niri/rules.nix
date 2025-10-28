{
  config,
  pkgs,
  ...
}: {
  programs.niri.settings = {
    ## ─────────────────────────────
    ## Layer Rules
    ## ─────────────────────────────
    layer-rules = [
      # Quickshell UI components
      {
        matches = [
          { namespace = "quickshell"; }
        ];
        place-within-backdrop = true;
      }

      # Blur wallpaper background
      {
        matches = [
          { namespace = "dms:blurwallpaper"; }
        ];
        opacity = 0.0;
      }

      {
        matches = [
          { namespace = "dms:blurwallpaper"; }
        ];
        place-within-backdrop = true;
        opacity = 1.0;
      }
    ];

    ## ─────────────────────────────
    ## Window Rules
    ## ─────────────────────────────
    window-rules = [
      # Brave browser
      {
        matches = [
          { app-id = "brave"; }
        ];
        open-maximized = true;
      }

      # Discord
      {
        matches = [
          { app-id = "discord"; }
        ];
        open-maximized = true;
        open-on-workspace = "chat";
        opacity = 0.90;
      }

      # Feishin music player
      {
        matches = [
          { app-id = "feishin"; }
        ];
        open-maximized = true;
        open-on-workspace = "music";
      }

      # KeePassXC (optional)
      {
        matches = [
          { app-id = "^org\\.keepassxc\\.KeePassXC$"; }
        ];
        open-maximized = true;
        block-out-from = "screen-capture";
      }

      # Steam notification popups
      {
        matches = [
          {
            app-id = "steam";
            title = "^notificationtoasts_\\d+_desktop$";
          }
        ];
        default-floating-position = {
          x = 10;
          y = 10;
          relative-to = "bottom-right";
        };
      }

      # Default rule for all windows (rounded corners + clipping)
      {
        matches = [ {} ];
        geometry-corner-radius = {
          top-left = 12.0;
          top-right = 12.0;
          bottom-left = 12.0;
          bottom-right = 12.0;
        };
        clip-to-geometry = true;
      }
    ];
  };
}

