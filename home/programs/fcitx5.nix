{
  pkgs,
  ...
}:
{
  i18n.inputMethod = {
    enable = true;
    type = "fcitx5";
    fcitx5.addons = with pkgs; [
      fcitx5-lua
      fcitx5-configtool
      fcitx5-chinese-addons
      fcitx5-gtk
      fcitx5-qt
    ];
    fcitx5.waylandFrontend = true;
  };
}
