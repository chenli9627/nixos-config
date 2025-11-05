{ pkgs, ... }:
{

  services = {
    mako = {
      enable = true;
      settings = {
        background-color = "#282828";
        border-color = "#504945";
        default-timeout = 5000;
      };
    };
    cliphist = {
      enable = true;
      allowImages = true;
      extraOptions = [
        "-max-dedupe-search"
        "200"
        "-max-items"
        "1000"
      ];
    };
    udiskie = {
      enable = true;
    };
    gnome-keyring.enable = true;

    swayidle =
      let
        # Lock command
        lock = "${pkgs.swaylock}/bin/swaylock --daemonize";
        # TODO: modify "display" function based on your window manager
        # Sway
        # display = status: "swaymsg 'output * power ${status}'"; \
        # Hyprland
        # display = status: "hyprctl dispatch dpms ${status}";
        # Niri
        display = status: "${pkgs.niri}/bin/niri msg action power-${status}-monitors";
      in
      {
        enable = true;
        timeouts = [
          {
            timeout = 300; # in seconds
            command = "${pkgs.libnotify}/bin/notify-send 'Locking in 5 seconds' -t 5000";
          }
          {
            timeout = 305;
            command = lock;
          }
          {
            timeout = 310;
            command = display "off";
            resumeCommand = display "on";
          }
          {
            timeout = 1800;
            command = "${pkgs.systemd}/bin/systemctl suspend";
          }
        ];
        events = [
          {
            event = "before-sleep";
            # adding duplicated entries for the same event may not work
            command = (display "off") + "; " + lock;
          }
          {
            event = "after-resume";
            command = display "on";
          }
          {
            event = "lock";
            command = (display "off") + "; " + lock;
          }
          {
            event = "unlock";
            command = display "on";
          }
        ];
      };
    # swayidle = {
    #   # idle management daemon
    #   # swayidle -w
    #   # timeout 601 'niri msg action power-off-monitors'
    #   # timeout 600 'swaylock -f' before-sleep 'swaylock -f'
    #   enable = true;
    #   events = [
    #     {
    #       event = "before-sleep";
    #       command = "${pkgs.swaylock}/bin/swaylock -fF";
    #     }
    #     {
    #       event = "lock";
    #       command = "lock";
    #     }
    #   ];
    #   extraArgs = [ "-w" ];
    #   timeouts = [
    #     {
    #       timeout = 61;
    #       command = "niri msg action power-off-monitors";
    #     }
    #     {
    #       timeout = 60;
    #       command = "${pkgs.swaylock}/bin/swaylock -fF";
    #     }
    #     {
    #       timeout = 900;
    #       command = "${pkgs.systemd}/bin/systemctl suspend";
    #     }
    #   ];
    # };
    polkit-gnome.enable = true;
  };

  programs = {
    alacritty.enable = true;
    fuzzel.enable = true;
    swaylock.enable = true;
  };
  # xdg.portal = {
  #   enable = true;
  #   extraPortals = [
  #     pkgs.xdg-desktop-portal-gnome
  #     pkgs.xdg-desktop-portal-gtk
  #   ];
  #   configPackages = [ pkgs.gnome.gnome-session ];
  # };

}
