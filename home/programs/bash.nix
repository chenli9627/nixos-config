{pkgs, ...}: {
  programs.bash = {
    enable = true;
    enableCompletion = true;
    shellAliases = {
      n = "nvim";
      lzd = "lazydocker";
      lzg = "lazygit";
      ":q" = "exit";
      ".." = "cd ..";
    };
    bashrcExtra = ''
      eval "$(direnv hook bash)"
    '';
  };
}
