{
  programs.zellij = {
    enable = true;
    settings = {
      # theme = "gruvbox-dark";
      auto_start = false;
      theme = "catppuccin-macchiato";
      default_layout = "compact";
      pane_frames = false;
    };

  };
}

# layout {
#     pane size=1 borderless=true {
#         plugin location="tab-bar"
#     }
#     pane
#     pane size=1 borderless=true {
#         plugin location="status-bar"
#     }
# }
