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
      qt6Packages.fcitx5-configtool
      # fcitx5-configtool
      qt6Packages.fcitx5-chinese-addons
      fcitx5-gtk
      fcitx5-table-extra
      qt6Packages.fcitx5-with-addons
      fcitx5-rime
      rime-ls
      librime
      librime-lua
    ];
    fcitx5.waylandFrontend = true;
  };
}
