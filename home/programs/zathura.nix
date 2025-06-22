{pkgs, ...}: {
  programs.zathura = {
    enable = true;
    mappings = {
      "<Right>" = "navigate next";
      D = "toggle_page_mode";
      "[fullscreen] <C-i>" = "zoom in";
    };
  };
}
