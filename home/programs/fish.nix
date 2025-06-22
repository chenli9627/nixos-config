{pkgs, ...}: {
  programs.fish = {
    enable = true;
    shellAbbrs = {
      lzg = "lazygit";
      lzd = "lazydocker";
      n = "nvim";
    };
  };
}
