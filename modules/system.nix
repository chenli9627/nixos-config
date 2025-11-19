{
  # config,
  pkgs,
  username,
  lib,
  ...
}:
{
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users = {
    defaultUserShell = pkgs.bash;
    users.${username} = {
      isNormalUser = true;
      useDefaultShell = true;
      # shell = pkgs.bash;
      extraGroups = [
        "wheel"
        "docker"
        "networkmanager"
      ]; # Enable ‘sudo’ for the user.
      # packages = with pkgs; [
      #   tree
      # ];
    };
  };

  nix = {
    settings = {
      trusted-users = [ username ];
      substituters = [
        "https://mirrors.tuna.tsinghua.edu.cn/nix-channels/store"
        "https://mirrors.ustc.edu.cn/nix-channels/store"
        "https://mirrors.cernet.edu.cn/nix-channels/store"
        # "https://hyprland.cachix.org"
        "https://cache.garnix.io"
      ];
      trusted-public-keys = [
        # "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
        "cache.garnix.io:CTFPyKSLcx5RMJKfLo5EEPUObbA78b0YQ2DTCJXqr9g="
      ];
      experimental-features = "nix-command flakes";
      builders-use-substitutes = true;
    };

    # do garbage collection weekly to keep disk usage low
    gc = {
      automatic = lib.mkDefault true;
      dates = lib.mkDefault "weekly";
      options = lib.mkDefault "--delete-older-than 7d";
    };
    settings.auto-optimise-store = true;
  };

  nixpkgs.config.allowUnfree = true;

  # Set your time zone.
  time.timeZone = "Asia/Shanghai";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.supportedLocales = [
    "zh_CN.UTF-8/UTF-8"
    "en_US.UTF-8/UTF-8"
  ];

  services = {
    # Enable CUPS to print documents.
    printing.enable = true;
    # Enable touchpad support (enabled default in most desktopManager).
    libinput.enable = true;
  };

  # fonts.packages = with pkgs; [
  #   noto-fonts
  #   noto-fonts-cjk-sans
  #   noto-fonts-cjk-serif
  #   noto-fonts-emoji
  #   noto-fonts-color-emoji
  #   liberation_ttf
  #   fira-code
  #   fira-code-symbols
  #   nerd-fonts.caskaydia-cove
  #   nerd-fonts.caskaydia-mono
  #   # Maple Mono (Ligature TTF unhinted)
  #   maple-mono.truetype
  #   # Maple Mono NF (Ligature unhinted)
  #   maple-mono.NF-unhinted
  #   # Maple Mono NF CN (Ligature unhinted)
  #   maple-mono.NF-CN-unhinted
  #   nerd-fonts.jetbrains-mono
  #   lxgw-wenkai
  # ];

  environment.systemPackages = with pkgs; [
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    neovim
    fish
    tree
    wget
    git
    curl
    wget
    sqlite
    alsa-utils
    dmidecode # for auto-cpufreq
  ];

  # Enable sound.
  # services.pulseaudio.enable = true;
  # OR
  services.pipewire = {
    enable = true;
    pulse.enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
  };

  environment.variables.EDITOR = "nvim";
  programs = {
    dconf.enable = true;
  };

  # environment.variables = {
  #   # GTK_IM_MODULE = "fcitx"; # hyprland not allow
  #   # QT_IM_MODULE = "fcitx";
  #   QT_IM_MODULE = "wayland"; # for qt6 apps
  #   XMODIFIERS = "@im=fcitx";
  #   SDL_IM_MODULE = "fcitx";
  #   GLFW_IM_MODULE = "ibus";
  # };
  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  programs.mtr.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };
  security.polkit.enable = true;
  security.rtkit.enable = true;

  documentation.man.generateCaches = false;

  system.stateVersion = "25.05"; # Did you read the comment?
}
