{
  services = {
    blueman.enable = true;
    gvfs.enable = true;
  };
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
