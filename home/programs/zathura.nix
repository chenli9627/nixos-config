{pkgs, ...}: {
  programs.zathura = {
    enable = true;
    zathura.mappings = {
      "<Right>" = "navigate next";
      D = "toggle_page_mode";
      "[fullscreen] <C-i>" = "zoom in";
    };
  };
}
