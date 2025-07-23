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
      "keydon" = "sudo systemctl start keyd";
      "keydoff" = "sudo systemctl stop keyd";
      "waybar-reload" = "pkill waybar && hyprctl dispatch exec waybar";
    };
    shellInit = ''
      direnv hook fish | source
      set -g direnv_fish_mode eval_after_arrow
      set -gx GO111MODULE on
      set -gx GOPROXY https://goproxy.cn
    '';
  };
}
