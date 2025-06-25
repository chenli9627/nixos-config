{pkgs, ...}: {
  programs.direnv = {
    enable = true;
    enableBashIntegration = true;
    # It's enabled by default
    # enableFishIntegration = true;
    nix-direnv.enable = true;
    config = {};
  };
}
