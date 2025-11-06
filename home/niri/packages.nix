{ inputs, pkgs, ... }:
{

  home.packages =
    with pkgs;
    [
      alacritty
      networkmanager_dmenu # for fuzzel
      xwayland-satellite
      wtype # for bemoji
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
      waypaper
      bemoji # for fuzzel emoji picker
    ]
    ++ [
      inputs.nixpkgs-unstable.legacyPackages.x86_64-linux.bzmenu
    ];
}
