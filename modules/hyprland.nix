{
  pkgs,
  config,
  ...
}: {
  # Initial login experience
  services.greetd = {
    enable = true;
    settings.default_session.command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --cmd Hyprland";
  };
  programs.hyprland.enable = true;

  services.gvfs.enable = true;
  services.blueman.enable = true;
  security.pam.services.hyprlock = {};
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
