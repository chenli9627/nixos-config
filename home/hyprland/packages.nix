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
    sushi # for file quick previewer
    code-nautilus
    gvfs
    openssh
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
