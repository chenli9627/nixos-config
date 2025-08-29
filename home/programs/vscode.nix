{ pkgs, ... }:
{
  programs.vscode = {
    enable = true;
    # mutableExtensionsDir = false; # default to true
    profiles.default = {
      enableExtensionUpdateCheck = false;
      enableUpdateCheck = false;
      extensions = with pkgs.vscode-extensions; [
        yzhang.markdown-all-in-one
        golang.go
        myriad-dreamin.tinymist
        github.github-vscode-theme
        catppuccin.catppuccin-vsc
        jnoortheen.nix-ide
        # scalameta.metals
        ms-python.python
        ms-python.debugpy
        kamadorueda.alejandra
        asvetliakov.vscode-neovim
        ms-vscode.cpptools-extension-pack
        ms-vscode.cpptools
        sainnhe.gruvbox-material
        ms-vscode.cmake-tools
        mkhl.direnv
        rust-lang.rust-analyzer
        dbaeumer.vscode-eslint
        dart-code.flutter
        jdinhlife.gruvbox
        tomoki1207.pdf
        ecmel.vscode-html-css
        # bierner.markdown-mermaid # something wrong with this extension
        ms-azuretools.vscode-docker
        streetsidesoftware.code-spell-checker
        redhat.java
        vscjava.vscode-maven
        vscjava.vscode-gradle
        vscjava.vscode-java-dependency
        vscjava.vscode-java-debug
        vscjava.vscode-java-test
        visualstudioexptteam.vscodeintellicode
        vscjava.vscode-java-pack
        # vscjava.vscode-spring-initializr
      ];
      userSettings = {
        "redhat.telemetry.enabled" = false;
        "editor.fontFamily" = "CaskaydiaMono Nerd Font Mono";
        "chat.agent.enabled" = false;
        "chat.commandCenter.enabled" = false;
        # "metals.javaVersion" = "21";
        "workbench.colorTheme" = "Gruvbox Dark Hard";
        "explorer.confirmDelete" = false;
        "explorer.confirmDragAndDrop" = false;
        "extensions.autoUpdate" = false;
        "update.mode" = "none";
        # "nix.formatterPath" = "alejandra";
        "extensions.experimental.affinity" = {
          "asvetliakov.vscode-neovim" = 1;
        };
      };
      keybindings = [
        {
          key = "ctrl+c";
          command = "editor.action.clipboardCopyAction";
          when = "textInputFocus";
        }
        {
          key = "ctrl+e";
          command = "workbench.view.explorer";
          when = "viewContainer.workbench.view.explorer.enabled";
        }
      ];
    };
  };
}
