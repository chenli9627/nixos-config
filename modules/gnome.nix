{pkgs, ...}: {
  # Enable the X11 windowing system.
  services.xserver.enable = true;
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;
  environment.gnome.excludePackages = with pkgs; [totem baobab orca gnome-usage gnome-music simple-scan gnome-weather decibels yelp gnome-maps gnome-tour gnome-secrets gnome-system-monitor gnome-logs gnome-tecla gnome-contacts];
}
