{ pkgs, ... }: {
  programs.chromium = {
    enable = true;
    package = pkgs.brave;

    extensions = [
      {
        id = "cjpalhdlnbpafiamejdnhcphjbkeiagm"; # uBlock Origin
        updateUrl = "https://clients2.google.com/service/update2/crx";
      }
      {
        id = "eimadpbcbfnmbkopoojfekhnkhdbieeh"; # Dark Reader
        updateUrl = "https://clients2.google.com/service/update2/crx";
      }
      {
        id = "mnjggcdmjocbbbhaepdhchncahnbgone"; # SponsorBlock
        updateUrl = "https://clients2.google.com/service/update2/crx";
      }
      {
        id = "gebbhagfogifgggkldgodflihgfeippi"; # Return YouTube Dislike
        updateUrl = "https://clients2.google.com/service/update2/crx";
      }
      {
        id = "hipekcciheckooncpjeljhnekcoolahp"; # Tabliss
        updateUrl = "https://clients2.google.com/service/update2/crx";
      }
      {
        id = "nngceckbapebfimnlniiiahkandclblb"; # Bitwarden
        updateUrl = "https://clients2.google.com/service/update2/crx";
      }
      {
        id = "jghecgabfgfdldnmbfkhmffcabddioke"; # Volume Master
        updateUrl = "https://clients2.google.com/service/update2/crx";
      }
    ];

    commandLineArgs = [
      "--enable-features=VaapiVideoDecoder"
      "--ozone-platform=wayland"
      "--enable-wayland-ime"
      "--gtk-version=4"
      "--force-dark-mode=0" # optional
      "--in-process-gpu"
      "--enable-native-gpu-memory-buffers"
      "--use-system-theme"
    ];
  };
}

