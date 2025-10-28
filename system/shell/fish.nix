{ config, pkgs, ... }:

{
  programs.fish = {
    enable = true;

    interactiveShellInit = ''
      if status is-interactive
          # Commands to run in interactive sessions can go here
      end

      # fish fzf key bindings
      function fish_user_key_bindings
          fzf_key_bindings
      end

      # Bang Bang OMF Plugin
      function __history_previous_command
        switch (commandline -t)
        case "!"
          commandline -t $history[1]; commandline -f repaint
        case "*"
          commandline -i !
        end
      end

      function __history_previous_command_arguments
        switch (commandline -t)
        case "!"
          commandline -t ""
          commandline -f history-token-search-backward
        case "*"
          commandline -i '$'
        end
      end

      bind ! __history_previous_command
      bind '$' __history_previous_command_arguments

      # Unimatrix Function
      function matrix
          unimatrix -a -l m
      end

      # Aliases
      alias ls="lsd"
      alias n="nvim"

      # Starship prompt
      starship init fish | source

      # Fastfetch system info
      fastfetch
    '';
  };
}

