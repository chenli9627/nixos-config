{pkgs,...}:{
  programs.zellij= {
    enable = true;
    # enableBashIntegration = true;
    # enableFishIntegration = true;
    settings = {
      # theme = "dracula";
      theme = "catppuccin-latte";
      auto_start = false;
      # default_layout = "compact";
    };
  };
}
