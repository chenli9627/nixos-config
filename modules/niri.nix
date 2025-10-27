{ pkgs, ... }:
{

  programs = {
    niri = {
      enable = true;
    };
  };

  security.pam.services.swaylock = { };

  xdg.portal = {
    enable = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-gnome
      pkgs.xdg-desktop-portal-gtk
    ];
    configPackages = [ pkgs.gnome-session ];
  };
}
