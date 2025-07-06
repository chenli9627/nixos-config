{
  pkgs,
  inputs,
  ...
}: {
  wayland.windowManager.hyprland.plugins = [
    # pkgs.hyprlandPlugins.<plugin>
  ];
}
