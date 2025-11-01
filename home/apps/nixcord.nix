{ config, pkgs, ... }:

{
  programs.nixcord = {
    enable = true;

    # enable desktop client (vesktop)
    vesktop.enable = false;

    # disable browser-discord (redundant but fine)
    discord.enable = true;

    config = {
      useQuickCss = true;
      themeLinks = [];
      frameless = true;
    };

    extraConfig = {
      plugins = {
        hideAttachments = {
          enable = true;
        };

        ignoreActivities = {
          enable = true;
          ignorePlaying = true;
          ignoreWatching = true;
          ignoredActivities = [
            "Playing"
            "Watching"
            "Competing"
          ];
        };
      };
    };
  };
}

