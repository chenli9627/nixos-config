{ pkgs, ... }:
{
  programs.kitty = pkgs.lib.mkForce {
    enable = true;
    themeFile = "GitHub_Light";
    shellIntegration.enableFishIntegration = true;
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
        (builtins.concatStringsSep "," mappings) + " Noto Sans CJK SC:weigh=600";
    };
  };
}
