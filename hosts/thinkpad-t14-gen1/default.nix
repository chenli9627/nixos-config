# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).
{
  imports = [
    ../../modules/default.nix

    # Include the results of the hardware scan.
    ./hardware-configuration.nix
    ./power.nix
  ];

  boot = {
    loader = {
      efi.canTouchEfiVariables = true;
      systemd-boot = {
        enable = true;
        consoleMode = "auto";
        configurationLimit = 10;
      };
    };
    kernel.sysctl = {
      "vm.swappiness" = 5;
      "kernel.sysrq" = 1;
    };

    kernelParams = [
      "quite"
      "splash"
    ];

    extraModprobeConfig = ''
      # example settings
      # options yourmodulename optionA=valueA optionB=valueB # syntax
      options thinkpad_acpi  fan_control=1                 # example #1 kernel module parameter
      # options usbcore        blinkenlights=1               # example #2 kernel module parameter
    '';

    # boot = {
    #   loader = {
    #     systemd-boot.enable = false;
    #     grub = {
    #       enable = true;
    #       # device = "nixos";
    #       # device = "/dev/disk/by-uuid/7D6C-950A";
    #       device = "nodev";
    #       efiSupport = true;
    #       # useOSProber = true;
    #       fontSize = 22;
    #       configurationLimit = 20;
    #     };
    #     efi = {
    #       canTouchEfiVariables = true;
    #       efiSysMountPoint = "/boot";
    #     };
    #   };
    # };
  };

  # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
  # (the default) this is the recommended approach. When using systemd-networkd it's
  # still possible to use this option, but it's recommended to use it in conjunction
  # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
  # networking.useDHCP = lib.mkDefault true;
  # networking.interfaces.wlp1s0.useDHCP = lib.mkDefault true;
  networking = {
    hostName = "nixos-thinkpad"; # Define your hostname.
    # Pick only one of the below networking options.
    # wireless.enable = true; # Enables wireless support via wpa_supplicant.
    networkmanager.enable = true; # Easiest to use and most distros use this by default.
    useDHCP = false;
    dhcpcd.enable = false;
    # networkmanager.wifi.powersave = true;
  };

  systemd.services.configure-sound-leds = rec {
    wantedBy = [ "sound.target" ];
    after = wantedBy;
    serviceConfig.Type = "oneshot";
    script = ''
      # echo 0 | tee /sys/class/leds/platform::micmute/brightness # from https://github.com/NixOS/nixos-hardware/issues/1658
      # the original systemd service comes from https://discourse.nixos.org/t/mute-key-indicator-light-is-always-on/39528/11 and https://codeberg.org/AndrewKvalheim/configuration/src/commit/9b0b0f90a2220c635f67123d435d239182f73406/hosts/main/system.nix
      echo follow-route > /sys/class/sound/ctl-led/mic/mode
      echo follow-mute > /sys/class/sound/ctl-led/speaker/mode # follow-route pending https://discourse.nixos.org/t/20480
      # fixed F1 and F1 led problem
    '';
  };

  hardware.trackpoint = {
    enable = true;
    device = "TPPS/2 Elan TrackPoint";
    emulateWheel = true;
    sensitivity = 100;
    speed = 12;
  };

}
