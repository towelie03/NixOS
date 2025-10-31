{ config, pkgs, ... }:

{
  programs.nixcord = {
    enable = true;
    vesktop.enable = true;
    #quickCss = "some CSS";
    discord.enable = false;

    config = {
      useQuickCss = true;
      themeLinks = [];
      frameless = true;
      # Don't add `plugins` here — nixcord module doesn't support it
    };

    extraConfig = {
      plugins = {
        hideAttachments = { enable = true; };
        ignoreActivities = {
          enable = true;
          ignorePlaying = true;
          ignoreWatching = true;
          ignoredActivities = ["someActivity"];
        };
      };
    };
  };
}

