{
  services = {
    blueman.enable = true;
    gvfs.enable = true;
  };
  security.pam.services.hyprlock = { };
  programs.nautilus-open-any-terminal = {
    enable = true;
    terminal = "kitty";
  };
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };
  services.power-profiles-daemon.enable = true;

  environment.sessionVariables.NIXOS_OZONE_WL = "1";
}
