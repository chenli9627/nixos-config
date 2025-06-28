{pkgs, ...}: {
  programs.vscode = {
    enable = true;
    mutableExtensionsDir = false;
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
        scalameta.metals
        ms-python.python
        ms-python.debugpy
        kamadorueda.alejandra
        asvetliakov.vscode-neovim
        ms-vscode.cpptools-extension-pack
        ms-vscode.cpptools
        ms-vscode.cmake-tools
        mkhl.direnv
        rust-lang.rust-analyzer
        tomoki1207.pdf
        ecmel.vscode-html-css
        ms-azuretools.vscode-docker
      ];
      userSettings = {
        "editor.fontFamily" = "CaskaydiaMono Nerd Font Mono";
        "workbench.colorTheme" = "GitHub Light";
        "explorer.confirmDragAndDrop" = false;
        "extensions.autoUpdate"= false;
        "nix.formatterPath" = "alejandra";
        "extensions.experimental.affinity" = {
          "asvetliakov.vscode-neovim" = 1;
        };
      };
    };
  };
}
