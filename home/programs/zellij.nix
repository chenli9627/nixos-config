{ pkgs, ... }:
{
  programs.zellij = {
    enable = true;
    settings = {
      # theme = "gruvbox-dark";
      auto_start = false;
      theme = "catppuccin-macchiato";
      default_layout = "compact";
    };
  };
}
