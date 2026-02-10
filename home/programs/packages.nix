{ pkgs, inputs, ... }:
{
  programs = {
    firefox.enable = true;
    lazygit.enable = true;
    mpv.enable = true;
    zoxide.enable = true;
    zoxide.enableFishIntegration = true;
  };
  home.packages = with pkgs; [
    hmcl
    kdePackages.kdenlive
    moonlight-qt
    bluetui
    nemo-with-extensions
    font-manager
    xfce.mousepad
    gnome-clocks
    smartmontools
    tree-sitter
    ffmpeg
    nixfmt-rfc-style
    sqlite
    gopls
    pandoc
    typstyle
    nixd
    nil
    gnome-solanum
    gnome-font-viewer
    jetbrains.datagrip
    bc
    strawberry
    clang
    google-chrome
    miniserve
    bruno
    goldendict-ng
    localsend
    monolith
    satty
    calibre
    alsa-utils
    wl-clipboard
    xclip
    brightnessctl
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
    # fzf # A command-line fuzzy finder
    fd
    quickemu
    quickgui
    filezilla
    remmina
    kitty
    lazygit
    lazydocker
    ghostscript
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
    trash-cli
    nix-output-monitor
    glow # markdown previewer in terminal
    # btop # replacement of htop/nmon
    btop-rocm # for amd gpu usage
    htop
    iotop # io monitoring
    gdu
    radeontop
    duf
    nvme-cli
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
    boxes
    fortune-kind
    kdePackages.okular
    cherry-studio

    ## for developing
    nodejs_22
    pnpm
    bun

    go
  ];
}
