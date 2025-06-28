{pkgs,...}:{
  programs.zellij= {
    enable = true;
    enableBashIntegration = true;
    enableFishIntegration = true;
    # themes = [
    #   catppuccin-latte
    # ];
    settings = {
      theme = "dracula";
    };
  };
}
