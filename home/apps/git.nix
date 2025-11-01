{ pkgs, ... }: {
  programs.git = {
    enable = true;

    signing = {
      signByDefault = true;
    };

    settings = {
      user.name = "towelie03";
      user.email = "dbalsara2003@gmail.com";
      init.defaultBranch = "main";

      commit.gpgSign = true;
      gpg.format = "ssh";

      user.signingkey = "~/.ssh/id_ed25519.pub";
    };
  };
}

