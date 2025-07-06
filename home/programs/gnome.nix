{ pkgs, ... }:
{
  home.packages = with pkgs; [
    gnome-tweaks
    gnomeExtensions.just-perfection
    gnomeExtensions.appindicator
    gnomeExtensions.kimpanel
  ];

}
