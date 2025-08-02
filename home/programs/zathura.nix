{
  programs.zathura = {
    enable = true;
    mappings = {
      "<Right>" = "navigate next";
      # D = "toggle_page_mode";
      "<C-d>" = "toggle_page_mode";
      "D" = "scroll half-down";
      "U" = "scroll half-up";
      "[fullscreen] <C-i>" = "zoom in";
    };
  };
}
