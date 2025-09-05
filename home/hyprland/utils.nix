{ pkgs, ... }:
{
  services.mako = {
    enable = true;
    settings = {
      background-color = "#282828";
      border-color = "#504945";
    };
  };
  services.hyprpolkitagent.enable = true;
  # services.polkit-gnome.enable = true;
  programs.waybar = {
    enable = true;
    # systemd.enable = true;
  };
  programs.wofi = {
    enable = true;
  };
  services.cliphist = {
    enable = true;
    allowImages = true;
    extraOptions = [
      "-max-dedupe-search"
      "200"
      "-max-items"
      "1000"
    ];
  };
  services.udiskie = {
    enable = true;
  };
  services.hypridle = {
    enable = true;
  };
  services.hyprpaper = {
    enable = true;
  };
  programs.hyprlock = {
    enable = true;
  };
  services.hyprsunset = {
    enable = true;
  };
  services.gnome-keyring.enable = true;
}
