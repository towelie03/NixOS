{
  pkgs,
  ...
}: {
  programs.git = {
    enable = true;

    signing = {
      # Remove this key line when using SSH for signing
      signByDefault = true;
    };

    settings = {
      user.name = "towelie03";
      user.email = "dbalsara2003@gmail.com";
      init.defaultBranch = "main";

      commit.gpgSign = true;
      gpg.format = "ssh"; # use SSH for signing
    };
  };
}

