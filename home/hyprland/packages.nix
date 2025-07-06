{pkgs, ...}: {
  homePackages = with pkgs; [
    blueberry
    pamixer
    hyprshot
    hyprpicker
    nautilus
    libnotify
    playerctl
    bibata-cursors
    gnome-themes-extra
    hyprpaper
    hyprcursor
    playerctl
    hyprls
    hypridle
    hyprsysteminfo
  ];
}
