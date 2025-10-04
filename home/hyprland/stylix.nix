{ pkgs, ... }:
{
  stylix = {
    enable = true;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/rose-pine.yaml";

    fonts = {
      serif = {
        package = pkgs.dejavu_fonts;
        name = "Noto Serif CJK SC";
        # name = "DejaVu Serif";
      };

      sansSerif = {
        package = pkgs.dejavu_fonts;
        name = "Noto Sans CJK SC";
        # name = "DejaVu Sans";
      };

      monospace = {
        package = pkgs.dejavu_fonts;
        name = "Cascadia Mono";
        # name = "DejaVu Sans Mono";
      };

      emoji = {
        package = pkgs.noto-fonts-emoji;
        name = "Noto Color Emoji";
      };
    };

    targets = {
      gnome.enable = false;
      kde.enable = false;
      # qt.enable = true;
      # rori.enable = true;
      # mako.enable = true;
    };
    autoEnable = true;
  };
}
