{ pkgs, ... }:
{
  programs.brave = {
    enable = true;
  };

  # Stylix integration (optional)
  stylix.targets.brave.profileNames = [ "Cyclonus" ];
  stylix.enableReleaseChecks = false;
}

