{
  # config,
  pkgs,
  username,
  lib,
  ...
}:
{
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.${username} = {
    isNormalUser = true;
    shell = pkgs.fish;
    extraGroups = [
      "wheel"
      "docker"
      "networkmanager"
    ]; # Enable ‘sudo’ for the user.
    # packages = with pkgs; [
    #   tree
    # ];
  };

  nix = {
    settings = {
      trusted-users = [ username ];
      substituters = [
        "https://mirrors.tuna.tsinghua.edu.cn/nix-channels/store"
        "https://mirrors.ustc.edu.cn/nix-channels/store"
        "https://hyprland.cachix.org"
      ];
      trusted-public-keys = [
        "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
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

  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-cjk-serif
    noto-fonts-emoji
    noto-fonts-color-emoji
    liberation_ttf
    fira-code
    fira-code-symbols
    nerd-fonts.caskaydia-cove
    nerd-fonts.caskaydia-mono
    # Maple Mono (Ligature TTF unhinted)
    maple-mono.truetype
    # Maple Mono NF (Ligature unhinted)
    maple-mono.NF-unhinted
    # Maple Mono NF CN (Ligature unhinted)
    maple-mono.NF-CN-unhinted
    nerd-fonts.jetbrains-mono
    lxgw-wenkai
  ];

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
  ];

  # Enable sound.
  # services.pulseaudio.enable = true;
  # OR
  services.pipewire = {
    enable = true;
    pulse.enable = true;
    alsa.enable = true;
  };

  environment.variables.EDITOR = "nvim";
  programs = {
    fish.enable = true;
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
