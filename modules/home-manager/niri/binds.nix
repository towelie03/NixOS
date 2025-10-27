{ pkgs, inputs, username, config, ... }:

programs = {
  niri = {
    enable = true;

    settings = {
      prefer-no-csd = true;
      hotkey-overlay.skip-at-startup = true;
      screenshot-path = "~/Pictures/Screenshots/%Y-%m-%d-%H%M%S.png";

      environment = {
        ELECTRON_OZONE_PLATFORM_HINT = "auto";
        GDK_SCALE = "1";
        QT_QPA_PLATFORMTHEME = "gtk3";
        QT_QPA_PLATFORMTHEME_QT6 = "gtk3";
      };

      input = {
        focus-follows-mouse = true;

        touchpad.tap = true;

        keyboard = {
          repeat-delay = 300;
          repeat-rate  = 50;
        };
      };

      layout = {
        gaps = 8;
        center-focused-column = "never";
        default-column-width.proportion = 0.5;
        focus-ring = { off = true; width = 4; };
        border = { off = true; urgent-color = "#9b0000"; };
        shadow = { on = true; softness = 30; spread = 5; offset = { x = 0; y = 5; }; color = "#0007"; };
      };

      overview.backdrop-color = "#0E0825";

      layer-rule = [
        { match = { namespace = "quickshell"; }; place-within-backdrop = true; }
        { match = { namespace = "dms:blurwallpaper"; }; opacity = 0.0; place-within-backdrop = true; }
      ];

      window-rule = [
        { match = { app-id = "brave"; }; open-maximized = true; }
        { match = { app-id = "discord"; }; open-maximized = true; open-on-workspace = "chat"; opacity = 0.9; }
        { match = { app-id = "feishin"; }; open-maximized = true; open-on-workspace = "music"; }
        { match = { app-id = "steam"; title = "^notificationtoasts_\\d+_desktop$"; }; default-floating-position = { x = 10; y = 10; relative-to = "bottom-right"; } }
      ];
    };
  };
};
