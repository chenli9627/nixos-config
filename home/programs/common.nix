{pkgs, ...}: {
  # programs.lazygit.enable = true;
  programs = {
    # nix-ld.enable = true;
    firefox.enable = true;
    lazygit.enable = true;
    mpv.enable = true;
    # fish.enable = true;
    zoxide.enable = true;
    zoxide.enableFishIntegration = true;
    yazi.enable = true;
    yazi.enableFishIntegration = true;
    yazi.shellWrapperName = "y";

    zathura.enable = true;
    zathura.mappings = {
      "<Right>" = "navigate next";
      D = "toggle_page_mode";
      "[fullscreen] <C-i>" = "zoom in";
    };
    bash = {
      enable = true;
      enableCompletion = true;
    };
    obs-studio = {
      enable = true;
      plugins = with pkgs.obs-studio-plugins; [
        wlrobs
        obs-backgroundremoval
        obs-pipewire-audio-capture
        obs-vaapi #optional AMD hardware acceleration
        obs-gstreamer
        obs-vkcapture
      ];
    };
  };
  home.packages = with pkgs; [
    mycli
    gcc
    pandoc
    typst
    typstyle
    # nixd
    nil
    vscode
    jetbrains.idea-community-bin
    zulu
    lua
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
