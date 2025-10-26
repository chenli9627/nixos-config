{
  pkgs,
  inputs,
  ...
}:
{
  # wayland.windowManager.hyprland.plugins = with pkgs.hyprlandPlugins; [
  #   hyprscrolling
  # ];
  # wayland.windowManager.hyprland.plugins = [
  #   inputs.hyprland-plugins.packages.${pkgs.stdenv.hostPlatform.system}.hyprscrolling
  # ];
}
