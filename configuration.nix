# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).
{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
  ];

  # Use the systemd-boot EFI boot loader.
  # boot.loader.systemd-boot.enable = true;
  # do not need to keep too much generations
  # boot.loader.systemd-boot.configurationLimit = 10;
  # boot.loader.grub.configurationLimit = 10;
  # boot.loader.efi.canTouchEfiVariables = true;
  # boot.loader = {
  #   efi.canTouchEfiVariables = true;
  #   systemd-boot = {
  #     enable = true;
  #    configurationLimit = 10;
  #  };
  #};
  boot.loader = {
    systemd-boot.enable = false;
    grub = {
      enable = true;
      # device = "nixos";
      # device = "/dev/disk/by-uuid/7D6C-950A";
      device = "nodev";
      efiSupport = true;
      useOSProber = true;
    };
    efi = {
      canTouchEfiVariables = true;
      efiSysMountPoint = "/boot";
    };
  };

  networking.hostName = "nixos"; # Define your hostname.
  # Pick only one of the below networking options.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  networking.networkmanager.enable = true; # Easiest to use and most distros use this by default.

  # Set your time zone.
  time.timeZone = "Asia/Shanghai";

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";
  # networking.proxy.default = "http://192.168.5.229:7890";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.supportedLocales = ["zh_CN.UTF-8/UTF-8" "en_US.UTF-8/UTF-8"];
  # console = {
  #   font = "Lat2-Terminus16";
  #   keyMap = "us";
  #   useXkbConfig = true; # use xkb.options in tty.
  # };
  i18n.inputMethod = {
    enable = true;
    type = "fcitx5";
    fcitx5.addons = with pkgs; [fcitx5-lua fcitx5-configtool fcitx5-chinese-addons fcitx5-gtk];
    fcitx5.waylandFrontend = true;
  };
  # Enable the X11 windowing system.
  services.xserver.enable = true;
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;
  environment.gnome.excludePackages = with pkgs; [totem baobab orca gnome-usage gnome-music simple-scan gnome-weather decibels yelp gnome-maps gnome-tour gnome-secrets gnome-system-monitor gnome-logs gnome-tecla gnome-contacts];

  environment.variables.EDITOR = "vim";
  # Configure keymap in X11
  # services.xserver.xkb.layout = "us";
  # services.xserver.xkb.options = "eurosign:e,caps:escape";

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound.
  # services.pulseaudio.enable = true;
  # OR
  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  services.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.chen = {
    isNormalUser = true;
    shell = pkgs.fish;
    extraGroups = ["wheel" "docker" "networkmanager"]; # Enable ‘sudo’ for the user.
    # packages = with pkgs; [
    #   tree
    # ];
  };

  nixpkgs.config.allowUnfree = true;
  programs.clash-verge.enable = true;
  programs.clash-verge.autoStart = true;
  programs.fish.enable = true;
  # List packages installed in system profile.
  # You can use https://search.nixos.org/ to find more packages (and options).
  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-cjk-serif
    noto-fonts-emoji
    noto-fonts-color-emoji
    liberation_ttf
    fira-code
    fira-code-symbols
    nerd-fonts.caskaydia-mono
  ];
  # fontconfig.defaultFonts = {
  #     serif = ["Noto Serif" "Noto Color Emoji"];
  #     sansSerif = ["Noto Sans" "Noto Color Emoji"];
  #     monospace = ["JetBrainsMono Nerd Font" "Noto Color Emoji"];
  #     emoji = ["Noto Color Emoji"];
  # };

  environment.systemPackages = with pkgs; [
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    neovim
    fish
    tree
    wget
    git
    # gcc
    clash-verge-rev
    curl
    wget
    sqlite
  ];

  virtualisation = {
    docker = {
      storageDriver = "btrfs";
      enable = true;
      rootless = {
        enable = true;
        setSocketVariable = true;
      };
      daemon.settings.registry-mirrors = ["https://docker.m.daocloud.io"];
    };
    virtualbox = {
      host.enable = true;
      # do not set this to true avoiding recompiling virtualbox
      # host.enableExtensionPack = true;
      # it makes rebuild too slow
      # guest.enable = true;
      guest.dragAndDrop = true;
    };
  };
  # virtualisation.virtualbox.host.enable = true;
  # virtualisation.virtualbox.host.enableExtensionPack = true;
  users.extraGroups.vboxusers.members = ["chen"];
  /*
    virtualisation.docker = {
    storageDriver = "btrfs";
    enable = true;
    rootless = {
      enable = true;
      setSocketVariable = true;
    };
    daemon.settings.registry-mirrors = ["https://docker.m.daocloud.io"];
  };
  */
  environment.variables = {
    GTK_IM_MODULE = "fcitx";
    QT_IM_MODULE = "fcitx";
    XMODIFIERS = "@im=fcitx";
    # SDL_IM_MODULE=fcitx;
    GLFW_IM_MODULE = "ibus";
  };
  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  programs.mtr.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  networking.firewall.enable = false;

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  # system.copySystemConfiguration = true;

  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  #
  # Most users should NEVER change this value after the initial install, for any reason,
  # even if you've upgraded your system to a new NixOS release.
  #
  # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
  # so changing it will NOT upgrade your system - see https://nixos.org/manual/nixos/stable/#sec-upgrading for how
  # to actually do that.
  #
  # This value being lower than the current NixOS release does NOT mean your system is
  # out of date, out of support, or vulnerable.
  #
  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  nix.settings.substituters = ["https://mirrors.ustc.edu.cn/nix-channels/store"];
  nix.settings.trusted-users = ["chen"];
  system.stateVersion = "25.05"; # Did you read the comment?
  nix.settings.experimental-features = "nix-command flakes";
}
