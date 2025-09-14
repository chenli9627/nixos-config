{
  home.shellAliases = {
    ":q" = "exit";
    clr = "clear";
    lzd = "lazydocker";
    lzg = "lazygit";
  };
  home.shell.enableShellIntegration = true;
  programs.fish = {
    enable = true;
    generateCompletions = true;
    preferAbbrs = true;
    shellAbbrs = {
      n = "nvim";
      notes = "nvim ~/notes";
      "keydon" = "sudo systemctl start keyd";
      "keydoff" = "sudo systemctl stop keyd";
      "waybar-reload" = "pkill waybar && hyprctl dispatch exec waybar";
      "nixosconfig" = "nvim ~/nixos-config";
    };
    shellInit = ''
      direnv hook fish | source
      set -g direnv_fish_mode eval_after_arrow
      set -gx GO111MODULE on
      set -gx GOPROXY https://goproxy.cn
      # fortune | boxes -d parchment
    '';
  };
  programs.bash = {
    enable = true;
    enableCompletion = true;
    shellAliases = {
      n = "nvim";
      ".." = "cd ..";
    };
    bashrcExtra = ''
      eval "$(direnv hook bash)"
    '';
  };

}
