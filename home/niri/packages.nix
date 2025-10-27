{ pkgs, ... }:
{
  home.packages = with pkgs; [
    xwayland-satellite
    libnotify
    pamixer
    nautilus
    gparted
    playerctl
    sushi # for file quick previewer
    code-nautilus
    qimgv
    swaybg
    waybar
    gcr # Provides org.gnome.keyring.SystemPrompter
  ];
}
