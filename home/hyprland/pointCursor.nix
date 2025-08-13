{ pkgs, ... }:
{
  home.pointCursor = {
    enable = true;
    package = pkgs.adwaita-icon-theme;
    gtk.enable = true;
    hyprcursor = {
      enable = true;
      size = 24;
    };
    name = "Adwaita";
    size = 24;
    x11.enable = true;
  };
}
