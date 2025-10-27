{ pkgs, ... }:
{
  # programs.alacritty.enable = true; # Super+T in the default setting (terminal)
  # programs.fuzzel.enable = true; # Super+D in the default setting (app launcher)
  # programs.swaylock.enable = true; # Super+Alt+L in the default setting (screen locker)
  # programs.waybar.enable = true; # launch on startup in the default setting (bar)
  # services.mako.enable = true; # notification daemon
  # services.swayidle.enable = true; # idle management daemon
  # services.polkit-gnome.enable = true; # polkit
  # home.packages = with pkgs; [
  #   swaybg # wallpaper
  # ];
  services = {
    mako = {
      enable = true;
      settings = {
        background-color = "#282828";
        border-color = "#504945";
      };
    };
    cliphist = {
      enable = true;
      allowImages = true;
      extraOptions = [
        "-max-dedupe-search"
        "200"
        "-max-items"
        "1000"
      ];
    };
    udiskie = {
      enable = true;
    };
    gnome-keyring.enable = true;

    swayidle.enable = true; # idle management daemon

    polkit-gnome.enable = true;
  };

  programs = {
    alacritty.enable = true;
    fuzzel.enable = true;
    swaylock.enable = true;

  };

  home.packages = with pkgs; [
    gcr # Provides org.gnome.keyring.SystemPrompter
    swaybg
    waybar
  ];

  xdg.portal = {
    enable = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-gnome
      pkgs.xdg-desktop-portal-gtk
    ];
  };
}
