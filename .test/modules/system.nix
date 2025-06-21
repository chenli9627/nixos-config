{
  config,
  pkgs,
  username,
  lib,
  ...
}: {
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.${username} = {
    isNormalUser = true;
    shell = pkgs.fish;
    extraGroups = ["wheel" "docker" "networkmanager"]; # Enable ‘sudo’ for the user.
    # packages = with pkgs; [
    #   tree
    # ];
  };
  users.extraGroups.vboxusers.members = [username];

  # nix.settings.trusted-users = [username];
  nix.settings = {
    trusted-users = [username];
    substituters = [
      "https://mirrors.ustc.edu.cn/nix-channels/store"
      "https://cache.nixos.org"
    ];
    experimental-features = "nix-command flakes";
    builders-use-substitutes = true;
  };

  # do garbage collection weekly to keep disk usage low
  nix.gc = {
    automatic = lib.mkDefault true;
    dates = lib.mkDefault "weekly";
    options = lib.mkDefault "--delete-older-than 7d";
  };

  nixpkgs.config.allowUnfree = true;

  # Set your time zone.
  time.timeZone = "Asia/Shanghai";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.supportedLocales = ["zh_CN.UTF-8/UTF-8" "en_US.UTF-8/UTF-8"];

  # Enable CUPS to print documents.
  services.printing.enable = true;

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

  programs.dconf.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  networking.firewall.enable = false;

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;
  services.openssh = {
    enable = true;
    allowSFTP = true;
    startWhenNeeded = true;
    settings = {
      PasswordAuthentication = true;
      PermitRootLogin = "yes";
    };
  };

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

  # Enable sound.
  # services.pulseaudio.enable = true;
  # OR
  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  services.libinput.enable = true;
}
