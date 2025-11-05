{ pkgs, ... }:
{
  home.shellAliases = {
    ":q" = "exit";
    clr = "clear";
    lzd = "lazydocker";
    lzg = "lazygit";
    n = "nvim";
    "keydon" = "sudo systemctl start keyd";
    "keydoff" = "sudo systemctl stop keyd";
    pn = "pnpm";
    zj = "zellij";

  };
  home.shell.enableShellIntegration = true;

  programs = {
    #   zsh = {
    #     enable = true;
    #     enableVteIntegration = true;
    #     autocd = true;
    #     autosuggestion = {
    #       enable = true;
    #     };
    #     defaultKeymap = "viins";
    #     syntaxHighlighting.enable = true;
    #     zsh-abbr = {
    #       enable = true;
    #       abbreviations = {
    #         n = "nvim";
    #         notes = "nvim ~/notes";
    #         "keydon" = "sudo systemctl start keyd";
    #         "keydoff" = "sudo systemctl stop keyd";
    #         "waybar-reload" = "pkill waybar && hyprctl dispatch exec waybar";
    #         "nixosconfig" = "nvim ~/nixos-config";
    #         pn = "pnpm";
    #         zj = "zellij";
    #       };
    #     };
    #     initContent = ''
    #         eval "$(direnv hook zsh)"
    #         gtrash completion zsh > /dev/null
    #         if [[ $(ps --no-header --pid=$PPID --format=comm) != "fish" && -z ${BASH_EXECUTION_STRING} && ${SHLVL} == 1 ]]
    #         then
    #           shopt -q login_shell && LOGIN_OPTION='--login' || LOGIN_OPTION=\'\'
    #           exec fish $LOGIN_OPTION
    #         fi
    #     '';
    #
    #   };

    fish = {
      enable = true;
      generateCompletions = true;
      preferAbbrs = true;
      # shellAbbrs = {
      # };
      shellInit = ''
        direnv hook fish | source
        set -g direnv_fish_mode eval_after_arrow
        gtrash completion fish > /dev/null
        set fish_greeting # Disable greeting
	fish_vi_key_bindings
      '';
    };

    bash = {
      enable = true;
      enableCompletion = true;
      enableVteIntegration = true;
      shellAliases = {
        ".." = "cd ..";
      };
      bashrcExtra = ''
        eval "$(direnv hook bash)"
        gtrash completion bash > /dev/null

      '';
    };
  };

}
