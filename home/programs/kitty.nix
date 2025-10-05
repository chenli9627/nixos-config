{
  programs.kitty = {
    enable = true;
    # themeFile = "rose-pine-moon";
    # themeFile = "GitHub_Light";
    # themeFile = "GruvboxMaterialDarkMedium";
    shellIntegration.enableFishIntegration = true;
    shellIntegration.enableBashIntegration = true;
    # extraPackages = with pkgs; [ kitty-themes ];
    keybindings = {

    };
    settings = {
      font_family = "CaskaydiaMono Nerd Font Mono";
      enable_audio_bell = false;
      symbol_map =
        let
          mappings = [
            "U+4E00-U+9FFF"
            "U+3400-U+4DBF"
          ];
        in
        (builtins.concatStringsSep "," mappings) + " Noto Sans CJK SC Medium";
    };
    extraConfig = "
        map alt+l next_tab
        map alt+h previous_tab
      ";
  };
}
