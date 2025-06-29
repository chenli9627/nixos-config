{pkgs, ...}: {
  programs.bash = {
    enable = true;
    enableCompletion = true;
    shellAlias = {
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
