{ config, lib, pkgs, ... }:

{
  programs.fish = {
    enable = true;

    interactiveShellInit = ''
      set fish_greeting
      # History repeat functions
      function __history_repeat_last
        if test (commandline -t) = "!"
          commandline -t ""
          commandline -f history-search-backward
        else
          commandline -i "!"
        end
      end

      function __history_repeat_args
        if test (commandline -t) = "!"
          commandline -t ""
          commandline -f history-token-search-backward
        else
          commandline -i '$'
        end
      end

      # Bind keys
      bind ! __history_repeat_last
      bind '$' __history_repeat_args
    '';

    shellAliases = {
      n = "nvim";
      cd = "z";
      cdi = "zi";
      ls = "lsd";
      cat = "bat";
      grep = "rg";
      find = "fd";
    };
  };
}
