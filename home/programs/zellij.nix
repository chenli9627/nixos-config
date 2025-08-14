{ pkgs, ... }:
{
  programs.zellij = {
    enable = true;
    settings = {
      theme = "gruvbox-dark";
      auto_start = false;
      # default_layout = "compact";
    };
  };
}
