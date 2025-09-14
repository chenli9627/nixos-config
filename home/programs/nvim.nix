{ pkgs, ... }:
{
  programs.neovim = {
    enable = true;
    # viAlias = true;
    # vimAlias = true;
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
