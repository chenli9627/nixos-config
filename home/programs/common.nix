{pkgs, ...}: {
  programs = {
    # nix-ld.enable = true;
    firefox.enable = true;
    lazygit.enable = true;
    mpv.enable = true;
    zoxide.enable = true;
    zoxide.enableFishIntegration = true;
    yazi.enable = true;
    yazi.enableFishIntegration = true;
    yazi.shellWrapperName = "y";
  };
  home.packages = with pkgs; [
    ulauncher
    wmctrl
    mycli
    tree-sitter
    gcc
    lua-language-server
    sqlite
    gopls
    pandoc
    typst
    typstyle
    # nixd
    nil
    vscode
    jetbrains.idea-community-bin
    zulu
    luajit
    luarocks
    python3Full
    go
    rustup
    ruby
    ruby-lsp
    nodejs_22
    pnpm
    albert
    strawberry
    wpsoffice-cn
    google-chrome
    zathura
    goldendict-ng
    localsend
    cherry-studio
    calibre
    scala
    scala-cli
    sbt
    metals
    # clang
    llvm
    wl-clipboard
    xclip
    gnome-tweaks
    gnomeExtensions.just-perfection
    gnomeExtensions.appindicator
    gnomeExtensions.kimpanel
    kitty
    neofetch
    fastfetch
    zip
    xz
    unzip
    unrar
    p7zip
    efibootmgr
    acpi
    ripgrep # recursively searches directories for a regex pattern
    jq # A lightweight and flexible command-line JSON processor
    yq-go # yaml processor https://github.com/mikefarah/yq
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
