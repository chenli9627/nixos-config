{
  pkgs,
  # config,
  ...
}:
{
  # Initial login experience
  services = {
    greetd = {
      enable = true;
      settings.default_session.command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --cmd Hyprland";
    };
  };
  security.pam.services.hyprlock = { };
  programs.hyprland.enable = true;

}
