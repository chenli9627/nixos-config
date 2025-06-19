{ config, pkgs, ... }: 

{

  # 注意修改这里的用户名与用户目录
  home.username = "chen";
  home.homeDirectory = "/home/chen";


  # 直接将当前文件夹的配置文件，链接到 Home 目录下的指定位置
  # home.file.".config/i3/wallpaper.jpg".source = ./wallpaper.jpg;

  # 递归将某个文件夹中的文件，链接到 Home 目录下的指定位置
  # home.file.".config/i3/scripts" = {
  #   source = ./scripts;
  #   recursive = true;   # 递归整个文件夹
  #   executable = true;  # 将其中所有文件添加「执行」权限
  # };

  # 直接以 text 的方式，在 nix 配置文件中硬编码文件内容
  # home.file.".xxx".text = ''
  #     xxx
  # '';

  # 设置鼠标指针大小以及字体 DPI（适用于 4K 显示器）
  # xresources.properties = {
  #   "Xcursor.size" = 16;
  #   "Xft.dpi" = 172;
  # };

  # 通过 home.packages 安装一些常用的软件
  # 这些软件将仅在当前用户下可用，不会影响系统级别的配置
  # 建议将所有 GUI 软件，以及与 OS 关系不大的 CLI 软件，都通过 home.packages 安装
  home.packages = with pkgs;[


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

    # scala
    scala
    scala-cli
    sbt
    metals

    # C/C++
    clang
    llvm

    # Clash
    # clash-verge-rev

    # Gnome things
    wl-clipboard
    gnome-tweaks
    gnomeExtensions.just-perfection
    gnomeExtensions.appindicator
    gnomeExtensions.kimpanel

    # terminal
    kitty

    # 如下是我常用的一些命令行工具，你可以根据自己的需要进行增删
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
    dnsutils  # `dig` + `nslookup`
    ldns # replacement of `dig`, it provide the command `drill`
    aria2 # A lightweight multi-protocol & multi-source command-line download utility
    socat # replacement of openbsd-netcat
    nmap # A utility for network discovery and security auditing
    ipcalc  # it is a calculator for the IPv4/v6 addresses

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

    btop  # replacement of htop/nmon
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

  # 启用 starship，这是一个漂亮的 shell 提示符
  # programs.starship = {
  #   enable = true;
  #   # 自定义配置
  #   settings = {
  #     add_newline = false;
  #     aws.disabled = true;
  #     gcloud.disabled = true;
  #     line_break.disabled = true;
  #   };
  # };

  # alacritty - 一个跨平台终端，带 GPU 加速功能
  # programs.alacritty = {
  #   enable = true;
  #   # 自定义配置
  #   settings = {
  #     env.TERM = "xterm-256color";
  #     font = {
  #       size = 12;
  #       draw_bold_text_with_bright_colors = true;
  #     };
  #     scrolling.multiplier = 5;
  #     selection.save_to_clipboard = true;
  #   };
  # };

  programs = {
    bash = {
      enable = true;
      enableCompletion = true;
      # TODO 在这里添加你的自定义 bashrc 内容
      # bashrcExtra = ''
      #   export PATH="$PATH:$HOME/bin:$HOME/.local/bin:$HOME/go/bin"
      # '';

      # TODO 设置一些别名方便使用，你可以根据自己的需要进行增删
      # shellAliases = {
      #   k = "kubectl";
      #   urldecode = "python3 -c 'import sys, urllib.parse as ul; print(ul.unquote_plus(sys.stdin.read()))'";
      #   urlencode = "python3 -c 'import sys, urllib.parse as ul; print(ul.quote_plus(sys.stdin.read()))'";
      # };
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
  # programs.zoxide.enable = true;
  # programs.zoxide.enableFishIntegration= true;
  programs.vscode = {
  enable = true;
  profiles.default.extensions = with pkgs.vscode-extensions; [
    # dracula-theme.theme-dracula
    # vscodevim.vim
    yzhang.markdown-all-in-one
    github.github-vscode-theme
    jnoortheen.nix-ide
    vscodevim.vim
    ms-python.python
    ms-python.debugpy
    # brettm12345.nixfmt-vscode
    kamadorueda.alejandra
  ];
};
programs.kitty = pkgs.lib.mkForce {
  enable = true;
  themeFile = "GitHub_Light";
  shellIntegration.enableFishIntegration = true;
  settings = {
    font_family = "CaskaydiaMono Nerd Font Mono";
    # include = "current-theme.conf";
    # confirm_os_window_close = 0;
    # dynamic_background_opacity = true;
    enable_audio_bell = false;
    # mouse_hide_wait = "-1.0";
    # window_padding_width = 10;
    # background_opacity = "0.5";
    # background_blur = 5;
    symbol_map = let
      mappings = [
        "U+4E00-U+9FFF"
	"U+3400-U+4DBF"
        # "U+23FB-U+23FE"
        # "U+2B58"
        # "U+E200-U+E2A9"
        # "U+E0A0-U+E0A3"
        # "U+E0B0-U+E0BF"
        # "U+E0C0-U+E0C8"
        # "U+E0CC-U+E0CF"
        # "U+E0D0-U+E0D2"
        # "U+E0D4"
        # "U+E700-U+E7C5"
        # "U+F000-U+F2E0"
        # "U+2665"
        # "U+26A1"
        # "U+F400-U+F4A8"
        # "U+F67C"
        # "U+E000-U+E00A"
        # "U+F300-U+F313"
        # "U+E5FA-U+E62B"
      ];
    in
      (builtins.concatStringsSep "," mappings) + " Noto Sans CJK SC";
      # (builtins.concatStringsSep "," mappings) + " Symbols Nerd Font";
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

