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
    enable = false;
    # systemd.enable = true;
  };

  programs.wofi = {
    enable = false;
  };
  programs.rofi = {
    enable = true;
    cycle = true;
    plugins = with pkgs; [
      rofi-emoji-wayland
      rofi-calc
      rofi-file-browser
    ];
    theme = "Arc-Dark";
    terminal = "kitty";
    font = "Cascadia Code 18";
    modes = [
      "drun"
      "emoji"
      "ssh"
      "recursivebrowser"
      "combi"
      "keys"
    ];
    extraConfig = {
      combi-modes = "drun,ssh,emoji";
    };
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
  home.packages = [ pkgs.gcr ]; # Provides org.gnome.keyring.SystemPrompter
}
