{
  pkgs,
  inputs,
  config,
  ...
}:

let
  hyprPath = "${config.home.homeDirectory}/nixos-config/home/hyprland/config/hypr";
  waybarPath = "${config.home.homeDirectory}/nixos-config/home/hyprland/config/waybar";
  wofiPath = "${config.home.homeDirectory}/nixos-config/home/hyprland/config/wofi";

in
{
  xdg.configFile."hypr".source = config.lib.file.mkOutOfStoreSymlink hyprPath;
  xdg.configFile."waybar".source = config.lib.file.mkOutOfStoreSymlink waybarPath;
  xdg.configFile."wofi".source = config.lib.file.mkOutOfStoreSymlink wofiPath;

  imports = [
    ./packages.nix
    # ./theme.nix
    ./plugins.nix
    ./utils.nix
  ];
  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
    systemd.variables = [ "--all" ];
    systemd.enable = false;

    # set the flake package
    # package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    # portalPackage =
    # inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
    package = null;
    portalPackage = null;
  };
  # programs.hyprland.withUWSM = true;
  # NIXOS_OZONE_WL = 1;
}
