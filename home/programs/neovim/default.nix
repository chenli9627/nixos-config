{
  config,
  pkgs,
  ...
}: let
  # path to your nvim config directory
  nvimPath = "${config.home.homeDirectory}/nix-config/home/programs/neovim/configfiles";
  # path to your doom emacs config directory
  # doomPath = "${config.home.homeDirectory}/nix-config/home/doom";
in {
  xdg.configFile."nvim".source = config.lib.file.mkOutOfStoreSymlink nvimPath;
  # xdg.configFile."doom".source = config.lib.file.mkOutOfStoreSymlink doomPath;

  # other configurations
  programs.neovim.enable = true;
}
