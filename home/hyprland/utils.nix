{ pkgs, ... }:
{
  # home.file = {
  #   ".config/hypr" = {
  #     source = ./config/hypr;
  #     recursive = true;
  #   };
  #   ".config/wofi" = {
  #     source = ./config/wofi;
  #     recursive = true;
  #   };
  #   ".config/waybar" = {
  #     source = ./config/waybar;
  #     recursive = true;
  #   };
  # };
  services.mako = {
    enable = true;
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
  services.gnome-keyring.enable = true;
}
