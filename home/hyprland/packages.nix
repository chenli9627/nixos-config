{pkgs, ...}: {
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
    bibata-cursors
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
