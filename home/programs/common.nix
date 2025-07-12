{ pkgs, ... }:
{
  programs = {
    # nix-ld.enable = true;
    firefox.enable = true;
    lazygit.enable = true;
    mpv.enable = true;
    zoxide.enable = true;
    zoxide.enableFishIntegration = true;
  };
  home.packages = with pkgs; [
    mycli
    pgcli
    litecli
    hypr
    smartmontools
    tree-sitter
    ffmpeg
    lua-language-server
    nixfmt-rfc-style
    sqlite
    gopls
    pandoc
    typst
    typstyle
    nixd
    nil
    vscode
    jetbrains.idea-community-bin
    zulu
    lua
    luarocks
    python3Full
    go
    ruby
    cargo
    ruby-lsp
    nodejs_22
    pnpm
    strawberry
    clang
    readest
    wpsoffice-cn
    google-chrome
    zathura
    goldendict-ng
    localsend
    cherry-studio
    keyd
    calibre
    # scala
    # scala-cli
    # scalafmt
    # ammonite
    # coursier
    # sbt
    # mill
    # metals
    # clang
    llvm
    wl-clipboard
    xclip
    brightnessctl
    kitty
    zip
    powertop
    xz
    unzip
    unrar
    p7zip
    efibootmgr
    acpi
    bat
    fastfetch
    ripgrep # recursively searches directories for a regex pattern
    jq # A lightweight and flexible command-line JSON processor
    yq-go # yaml processor https://github.com/mikefarah/yq
    fzf # A command-line fuzzy finder
    fd
    lazygit
    lazydocker
    ghostscript
    mermaid-cli
    zoxide
    tealdeer
    iperf3
    aria2 # A lightweight multi-protocol & multi-source command-line download utility
    socat # replacement of openbsd-netcat
    nmap # A utility for network discovery and security auditing
    file
    which
    tree
    gnused
    gnutar
    gawk
    zstd
    gnupg
    trashy
    nix-output-monitor
    glow # markdown previewer in terminal
    btop # replacement of htop/nmon
    htop
    iotop # io monitoring
    iftop # network monitoring
    nvtopPackages.amd
    strace # system call monitoring
    ltrace # library call monitoring
    lsof # list open files
    sysstat
    lm_sensors # for `sensors` command
    ethtool
    pciutils # lspci
    usbutils # lsusb
    pavucontrol
  ];
}
