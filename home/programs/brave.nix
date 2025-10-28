{ pkgs, ... }:
{
  programs.brave = {
    enable = true;
  }
    
  # Stylix integration (if you’re using it)
  stylix.targets.brave.profileNames = [ "Cyclonus" ];
  stylix.enableReleaseChecks = false;
}

