{
  config,
  pkgs,
  inputs,
  ...
}:

{
  environment.variables = {
    XCURSOR_SIZE = "16";
    QT_QPA_PLATFORM = "wayland";
    ELECTRON_OZONE_PLATFORM_HINT = "auto";
    GDK_SCALE = "1";
  };
}
