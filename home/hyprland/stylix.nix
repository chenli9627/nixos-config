{ pkgs, inputs, ... }:
{

  imports = [
    # inputs.zen-browser.homeModules.${zenRelease}
    # inputs.stylix.homeManagerModules.stylix
    inputs.stylix.homeModules.stylix
  ];

  stylix = {
    enable = true;
    # base16Scheme = "${pkgs.base16-schemes}/share/themes/rose-pine-dawn.yaml";
    # base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";
    base16Scheme = "${pkgs.base16-schemes}/share/themes/default-light.yaml";
    # base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-material-dark-hard.yaml";
    autoEnable = false;
    targets = {
      # hyprland.enable = false;
      # zed.enable = false;
      # neovim.enable = false;
      # fcitx5.enable = false;
      # vscode.enable = false;
      qt.enable = true;
      gtk.enable = true;
      xresources.enable = true;
      # rofi.enable = true; # rofi need its own font size
      # bat.enable = true;
      # kitty.enable = true;
    };

    fonts = {
      serif = {
        package = pkgs.noto-fonts-cjk-serif;
        name = "Noto Serif CJK SC";
        # name = "DejaVu Serif";
      };

      sansSerif = {
        package = pkgs.nerd-fonts.caskaydia-mono;
        name = "CaskaydiaMono Nerd Font Mono";

        # package = pkgs.noto-fonts-cjk-sans;
        # name = "Noto Sans CJK SC";
        # name = "DejaVu Sans";
      };

      monospace = {
        package = pkgs.nerd-fonts.caskaydia-mono;
        name = "CaskaydiaMono Nerd Font Mono";
        # name = "DejaVu Sans Mono";
      };

      emoji = {
        package = pkgs.noto-fonts-emoji;
        name = "Noto Color Emoji";
      };

      sizes = {
        applications = 11;
        desktop = 9;
      };
    };
  };
}
