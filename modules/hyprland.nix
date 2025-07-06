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

  services.blueman.enable = true;
  security.pam.services.hyprlock = {};
  programs.nautilus-open-any-terminal = {
    enable = true;
    terminal = "kitty";
  };
}
