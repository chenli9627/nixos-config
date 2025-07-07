{ pkgs, ... }:
{
  xdg.enable = true;
  xdg.portal = {
    enable = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-gtk
      pkgs.xdg-desktop-portal-hyprland
      # pkgs.xdg-desktop-portal-wlr
      # pkgs.xdg-desktop-portal-gnome
    ];
    configPackages = [
      pkgs.xdg-desktop-portal-gtk
      pkgs.xdg-desktop-portal-hyprland
      # pkgs.xdg-desktop-portal-wlr
      # pkgs.xdg-desktop-portal-gnome
    ];
    config.common = {
      default = [
        "gnome"
        "hyprland"
        "gtk"
      ];
      "org.freedesktop.impl.portal.Settings" = "gnome";
    };
  };
  # home.pointerCursor = {
  #   gtk.enable = true;
  #   # x11.enable = true;
  #   package = pkgs.bibata-cursors;
  #   name = "Bibata-Modern-Classic";
  #   size = 16;
  # };
  #
  # gtk = {
  #   enable = true;
  #
  #   theme = {
  #     package = pkgs.flat-remix-gtk;
  #     name = "Flat-Remix-GTK-Grey-Darkest";
  #   };
  #
  #   iconTheme = {
  #     package = pkgs.adwaita-icon-theme;
  #     name = "Adwaita";
  #   };
  #
  #   font = {
  #     name = "Sans";
  #     size = 11;
  #   };
  # };
}
