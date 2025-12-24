{ pkgs, ... }:
{

  home.packages = with pkgs; [
    dejavu_fonts
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-cjk-serif
    noto-fonts-color-emoji
    noto-fonts-color-emoji
    liberation_ttf
    fira-code
    fira-code-symbols
    nerd-fonts.caskaydia-cove
    nerd-fonts.caskaydia-mono
    # # Maple Mono (Ligature TTF unhinted)
    # maple-mono.truetype
    # # Maple Mono NF (Ligature unhinted)
    # maple-mono.NF-unhinted
    # # Maple Mono NF CN (Ligature unhinted)
    # maple-mono.NF-CN-unhinted
    nerd-fonts.jetbrains-mono
    lxgw-wenkai
    roboto
    roboto-serif
    nerd-fonts.fira-code
  ];

  fonts.fontconfig.enable = true;
}
