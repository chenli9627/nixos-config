{ pkgs, ... }:
{
  # gtk = {
  #   enable = true;
  #   font = {
  #     name = "CaskaydiaMono Nerd Font Regular";
  #     package = pkgs.nerd-fonts.caskaydia-mono;
  #     size = 11;
  #   };
  #   iconTheme = {
  #     package = pkgs.adwaita-icon-theme;
  #     name = "Adwaita";
  #   };
  #   theme = {
  #     package = pkgs.gnome-themes-extra;
  #     # name = "Adwaita";
  #     name = "Adwaita-dark";
  #   };
  # };
  #
  # qt = {
  #   enable = true;
  #   platformTheme.name = "adwaita";
  #   style = {
  #     # name = "adwaita";
  #     name = "adwaita-dark";
  #     package = pkgs.adwaita-qt6;
  #   };
  # };

  home.pointerCursor = {
    enable = true;
    package = pkgs.adwaita-icon-theme;
    gtk.enable = true;
    hyprcursor = {
      enable = true;
      size = 24;
    };
    name = "Adwaita";
    size = 24;
    # x11 = {
    # enable = true;
    #    defaultCursor = "Adwaita";
    # };
  };
  xresources.properties = {
    "Xft.dpi" = 192; # 根据缩放比例调整（96 × 缩放系数）

    # ! These might also be useful depending on your monitor and personal preference:
    "Xft.autohint" = 0;
    "Xft.lcdfilter" = "lcddefault";
    "Xft.hintstyle" = "hintfull";
    "Xft.hinting" = 1;
    "Xft.antialias" = 1;
    "Xft.rgba" = "rgb";
    # I wish these above may effect how xwayland apps behaves
    # update: it runs well😄
  };

  # home.sessionVariables.GTK_THEME = "Adwaita-dark";
  # home.sessionVariables.GTK_THEME = "Adwaita";

  # fonts.fontconfig = {
  #   enable = true;
  #   defaultFonts = {
  #     emoji = [ "Noto Color Emoji" ];
  #     monospace = [ "CaskaydiaMono Nerd Font Mono" ];
  #     serif = [ "Noto Serif CJK SC" ];
  #     # sansSerif = [ "Noto Sans CJK SC" ];
  #     sansSerif = [ "CaskaydiaMono Nerd Font Mono" ];
  #   };
  # };
}
