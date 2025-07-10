{
  programs.fish = {
    enable = true;
    generateCompletions = true;
    preferAbbrs = true;
    shellAbbrs = {
      lzg = "lazygit";
      lzd = "lazydocker";
      n = "nvim";
      ":q" = "exit";
      clr = "clear";
      notes = "nvim ~/notes";
    };
    shellInit = ''
      direnv hook fish | source
      set -g direnv_fish_mode eval_after_arrow
    '';
  };
}
