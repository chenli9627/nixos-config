{
  # config,
  pkgs,
  ...
}: {
  # home.username = "chen";
  # home.homeDirectory = "/home/chen";

  imports = [
    ../../home/core.nix

    # ../../home/fcitx5
    # ../../home/gnome
    # ../../home/neovim
    ../../home/programs
    # ../../home/shell
    # ../../home/vscode
  ];

  # home.packages = with pkgs; [
  #   mycli
  #   gcc
  #   pandoc
  #   typst
  #   typstyle
  #   # nixd
  #   nil
  #   vscode
  #   jetbrains.idea-community-bin
  #   zulu
  #   lua
  #   luarocks
  #   python3Full
  #   go
  #   rustup
  #   ruby
  #   ruby-lsp
  #   nodejs_22
  #   pnpm
  #   albert
  #   strawberry
  #   wpsoffice-cn
  #   google-chrome
  #   zathura
  #   goldendict-ng
  #   localsend
  #   cherry-studio
  #   calibre
  #   scala
  #   scala-cli
  #   sbt
  #   metals
  #   # clang
  #   llvm
  #   wl-clipboard
  #   gnome-tweaks
  #   gnomeExtensions.just-perfection
  #   gnomeExtensions.appindicator
  #   gnomeExtensions.kimpanel
  #   kitty
  #   neofetch
  #   fastfetch
  #   zip
  #   xz
  #   unzip
  #   unrar
  #   p7zip
  #   efibootmgr
  #   acpi
  #   ripgrep # recursively searches directories for a regex pattern
  #   jq # A lightweight and flexible command-line JSON processor
  #   yq-go # yaml processor https://github.com/mikefarah/yq
  #   fzf # A command-line fuzzy finder
  #   fd
  #   lazygit
  #   lazydocker
  #   ghostscript
  #   mermaid-cli
  #   yazi
  #   zoxide
  #   dysk
  #   tealdeer
  #   iperf3
  #   aria2 # A lightweight multi-protocol & multi-source command-line download utility
  #   socat # replacement of openbsd-netcat
  #   nmap # A utility for network discovery and security auditing
  #   file
  #   which
  #   tree
  #   gnused
  #   gnutar
  #   gawk
  #   zstd
  #   gnupg
  #   trashy
  #   nix-output-monitor
  #   glow # markdown previewer in terminal
  #   btop # replacement of htop/nmon
  #   htop
  #   iotop # io monitoring
  #   iftop # network monitoring
  #   nvtopPackages.amd
  #   strace # system call monitoring
  #   ltrace # library call monitoring
  #   lsof # list open files
  #   sysstat
  #   lm_sensors # for `sensors` command
  #   ethtool
  #   pciutils # lspci
  #   usbutils # lsusb
  #   pavucontrol
  # ];
  #
  # git 相关配置
  #  programs.git = {
  #    enable = true;
  #    userName = "chenli9627";
  #    userEmail = "chenli9627@gmail.com";
  #  };
  #  programs.lazygit.enable = true;

  # programs = {
  #   bash = {
  #     enable = true;
  #     enableCompletion = true;
  #   };
  #   firefox.enable = true;
  #   mpv.enable = true;
  #   # clash-verge.enable = true;
  #   # clash-verge.autoStart = true;
  #   obs-studio = {
  #     enable = true;
  #     plugins = with pkgs.obs-studio-plugins; [
  #       wlrobs
  #       obs-backgroundremoval
  #       obs-pipewire-audio-capture
  #       obs-vaapi #optional AMD hardware acceleration
  #       obs-gstreamer
  #       obs-vkcapture
  #     ];
  #   };
  # fish.enable = true;
  # zoxide.enable = true;
  # zoxide.enableFishIntegration = true;
  # yazi.enable = true;
  # yazi.enableFishIntegration = true;
  # yazi.shellWrapperName = "y";
  # zathura.enable = true;
  # zathura.mappings = {
  #   "<Right>" = "navigate next";
  #   D = "toggle_page_mode";
  #   "[fullscreen] <C-i>" = "zoom in";
  # };
  # };
  # programs.vscode = {
  #   enable = true;
  #   mutableExtensionsDir = false;
  #   profiles.default = {
  #     enableExtensionUpdateCheck = false;
  #     enableUpdateCheck = false;
  #     extensions = with pkgs.vscode-extensions; [
  #       yzhang.markdown-all-in-one
  #       golang.go
  #       myriad-dreamin.tinymist
  #       github.github-vscode-theme
  #       jnoortheen.nix-ide
  #       # vscodevim.vim
  #       ms-python.python
  #       ms-python.debugpy
  #       kamadorueda.alejandra
  #       asvetliakov.vscode-neovim
  #       ms-vscode.cpptools-extension-pack
  #       rust-lang.rust-analyzer
  #       tomoki1207.pdf
  #       ecmel.vscode-html-css
  #       ms-azuretools.vscode-docker
  #     ];
  #     userSettings = {
  #       "editor.fontFamily" = "CaskaydiaMono Nerd Font Mono";
  #       "workbench.colorTheme" = "GitHub Light";
  #       "explorer.confirmDragAndDrop" = false;
  #       "nix.formatterPath" = "alejandra";
  #       "extensions.experimental.affinity" = {
  #         "asvetliakov.vscode-neovim" = 1;
  #       };
  #     };
  #   };
  # };
  # programs.kitty = pkgs.lib.mkForce {
  #   enable = true;
  #   themeFile = "GitHub_Light";
  #   shellIntegration.enableFishIntegration = true;
  #   settings = {
  #     font_family = "CaskaydiaMono Nerd Font Mono";
  #     enable_audio_bell = false;
  #     symbol_map = let
  #       mappings = [
  #         "U+4E00-U+9FFF"
  #         "U+3400-U+4DBF"
  #       ];
  #     in
  #       (builtins.concatStringsSep "," mappings) + " Noto Sans CJK SC";
  #   };
  # };

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  # home.stateVersion = "25.05";
}
