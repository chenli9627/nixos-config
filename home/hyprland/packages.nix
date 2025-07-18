{ pkgs, ... }:
{
  home.packages = with pkgs; [
    blueberry
    pamixer
    hyprshot
    # hyprpicker
    nautilus
    libnotify
    xorg.xrdb
    # nwg-look
    gparted
    playerctl
    sushi # for file quick previewer
    code-nautilus
    qimgv
    adwaita-icon-theme
    gnome-keyring
    cheese
    # gsettings-desktop-schemas
    openssh
    glib
    gnome-themes-extra
    hyprpaper
    hyprcursor
    playerctl
    hyprls
    hypridle
    hyprsysteminfo
    waybar
  ];
}
