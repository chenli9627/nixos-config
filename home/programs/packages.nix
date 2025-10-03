{ pkgs, inputs, ... }:
{
  programs = {
    firefox.enable = true;
    lazygit.enable = true;
    mpv.enable = true;
    zoxide.enable = true;
    zoxide.enableFishIntegration = true;
  };
  home.packages =
    (with pkgs; [
      font-manager
      hypr
      xfce.mousepad
      xfce.thunar
      gnome-clocks
      smartmontools
      tree-sitter
      ffmpeg
      lua-language-server
      nixfmt-rfc-style
      sqlite
      gopls
      pandoc
      typstyle
      nixd
      nil
      gnome-solanum
      gnome-font-viewer
      jetbrains.idea-community-bin
      jetbrains.datagrip
      lua
      luarocks
      strawberry
      clang
      wpsoffice-cn
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
      gtrash
      nix-output-monitor
      glow # markdown previewer in terminal
      btop # replacement of htop/nmon
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

      ## for developing
      nodejs_22
      pnpm
      bun
    ])
    ++ [
      # inputs.zen-browser.packages.${pkgs.system}.default
    ];
}
