{
  config,
  pkgs,
  ...
}: {
  home.username = "chen";
  home.homeDirectory = "/home/chen";

  home.packages = with pkgs; [
    # typeset
    pandoc
    typst
    typstyle

    # nix
    nixd
    nil

    # dev tools
    vscode
    jetbrains.idea-community-bin

    # java
    zulu

    # lua
    lua
    luarocks

    # python
    python3Full

    # go
    go

    # rust
    rustup

    # ruby
    ruby
    ruby-lsp

    # node
    nodejs_22
    pnpm

    # Gui Apps
    albert
    strawberry
    wpsoffice-cn
    google-chrome
    goldendict-ng
    localsend
    cherry-studio
    calibre
    # clash-verge-rev

    # scala
    scala
    scala-cli
    sbt
    metals

    # C/C++
    clang
    llvm

    # Gnome things
    wl-clipboard
    gnome-tweaks
    gnomeExtensions.just-perfection
    gnomeExtensions.appindicator
    gnomeExtensions.kimpanel

    # terminal
    kitty

    neofetch
    fastfetch
    # nnn # terminal file manager

    # archives
    zip
    xz
    unzip
    unrar
    p7zip

    # utils
    ripgrep # recursively searches directories for a regex pattern
    jq # A lightweight and flexible command-line JSON processor
    yq-go # yaml processor https://github.com/mikefarah/yq
    eza # A modern replacement for ‘ls’
    fzf # A command-line fuzzy finder
    fd
    lazygit
    lazydocker
    ghostscript
    mermaid-cli
    yazi
    zoxide
    dysk
    tealdeer

    # networking tools
    mtr # A network diagnostic tool
    iperf3
    dnsutils # `dig` + `nslookup`
    ldns # replacement of `dig`, it provide the command `drill`
    aria2 # A lightweight multi-protocol & multi-source command-line download utility
    socat # replacement of openbsd-netcat
    nmap # A utility for network discovery and security auditing
    ipcalc # it is a calculator for the IPv4/v6 addresses

    # misc
    cowsay
    file
    which
    tree
    gnused
    gnutar
    gawk
    zstd
    gnupg
    trashy

    # nix related
    #
    # it provides the command `nom` works just like `nix`
    # with more details log output
    nix-output-monitor

    # productivity
    hugo # static site generator
    glow # markdown previewer in terminal

    btop # replacement of htop/nmon
    htop
    iotop # io monitoring
    iftop # network monitoring
    nvtopPackages.amd

    # system call monitoring
    strace # system call monitoring
    ltrace # library call monitoring
    lsof # list open files

    # system tools
    sysstat
    lm_sensors # for `sensors` command
    ethtool
    pciutils # lspci
    usbutils # lsusb
    ncpamixer
    pavucontrol
  ];

  # git 相关配置
  programs.git = {
    enable = true;
    userName = "chenli9627";
    userEmail = "chenli9627@gmail.com";
  };
  programs.lazygit.enable = true;

  programs = {
    bash = {
      enable = true;
      enableCompletion = true;
    };
    firefox.enable = true;
    # clash-verge.enable = true;
    # clash-verge.autoStart = true;
    fish.enable = true;
    zoxide.enable = true;
    zoxide.enableFishIntegration = true;
    yazi.enable = true;
    yazi.enableFishIntegration = true;
    yazi.shellWrapperName = "y";
  };
  programs.vscode = {
    enable = true;
    mutableExtensionsDir = false;
    profiles.default.extensions = with pkgs.vscode-extensions; [
      yzhang.markdown-all-in-one
      golang.go
      myriad-dreamin.tinymist
      github.github-vscode-theme
      jnoortheen.nix-ide
      vscodevim.vim
      ms-python.python
      ms-python.debugpy
      kamadorueda.alejandra
      asvetliakov.vscode-neovim
      ms-vscode.cpptools-extension-pack
      rust-lang.rust-analyzer
      tomoki1207.pdf
      ecmel.vscode-html-css
      ms-azuretools.vscode-docker
    ];
  };
  programs.kitty = pkgs.lib.mkForce {
    enable = true;
    themeFile = "GitHub_Light";
    shellIntegration.enableFishIntegration = true;
    settings = {
      font_family = "CaskaydiaMono Nerd Font Mono";
      enable_audio_bell = false;
      symbol_map = let
        mappings = [
          "U+4E00-U+9FFF"
          "U+3400-U+4DBF"
        ];
      in
        (builtins.concatStringsSep "," mappings) + " Noto Sans CJK SC";
    };
  };

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "25.05";
}
