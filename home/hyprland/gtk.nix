{ pkgs, ... }:
{
  gtk = {
    enable = true;
    cursorTheme = {
      name = "Adwaita";
      package = pkgs.adwaita-icon-theme;
      size = 24;
    };
    font = {
      name = "CaskaydiaMono Nerd Font Regular";
      package = pkgs.nerd-fonts.caskaydia-mono;
      size = 11;
    };
    iconTheme = {
      package = pkgs.adwaita-icon-theme;
      name = "Adwaita";
    };
    theme = {
      package = pkgs.gnome-themes-extra;
      name = "Adwaita-dark";
    };
  };

  home.sessionVariables.GTK_THEME = "Adwaita-dark";
}
