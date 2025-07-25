{
  config,
  pkgs,
  ...
}: let
  # path to your nvim config directory
  nvimPath = "${config.home.homeDirectory}/nixos-config/home/programs/neovim/configfiles";
  # path to your doom emacs config directory
  # doomPath = "${config.home.homeDirectory}/nix-config/home/doom";
in {
  xdg.configFile."nvim".source = config.lib.file.mkOutOfStoreSymlink nvimPath;
  # xdg.configFile."doom".source = config.lib.file.mkOutOfStoreSymlink doomPath;

  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
    defaultEditor = true;
    extraPackages = with pkgs; [
      lua-language-server
      nil
      nixd
      nixpkgs-fmt
      stylua
    ];
  };
}
