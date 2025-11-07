# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).
{
  imports = [
    ../../modules/default.nix

    # Include the results of the hardware scan.
    ./hardware-configuration.nix
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
    };

    # kernelParams = [
    #   # "amdgpu.dcdebugmask=0x10"
    #   # "nvme.noacpi=1" # seems to break something
    #   # "nvme_core.default_ps_max_latency_us=0"
    #   # "iommu=soft"
    #   # "pcie_aspm=off"
    #   # "pcie_port_pm=off"
    #   # "mem_sleep_default=deep"
    #   "acpi_backlight=native"
    #   "psmouse.synaptics_intertouch=0"
    # ];

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
    hostName = "nixos_thinkpad"; # Define your hostname.
    # Pick only one of the below networking options.
    # wireless.enable = true; # Enables wireless support via wpa_supplicant.
    networkmanager.enable = true; # Easiest to use and most distros use this by default.
    useDHCP = false;
    dhcpcd.enable = false;
    # networkmanager.wifi.powersave = true;
  };

  services.power-profiles-daemon.enable = true;
  # services.tlp = {
  #   enable = true;
  #   settings = {
  #     CPU_SCALING_GOVERNOR_ON_AC = "performance";
  #     CPU_SCALING_GOVERNOR_ON_BAT = "powersave";
  #
  #     CPU_ENERGY_PERF_POLICY_ON_BAT = "power";
  #     CPU_ENERGY_PERF_POLICY_ON_AC = "performance";
  #
  #     CPU_MIN_PERF_ON_AC = 0;
  #     CPU_MAX_PERF_ON_AC = 100;
  #     CPU_MIN_PERF_ON_BAT = 0;
  #     CPU_MAX_PERF_ON_BAT = 20;
  #
  #     # Optional helps save long term battery health
  #     START_CHARGE_THRESH_BAT0 = 40; # 40 and bellow it starts to charge
  #     STOP_CHARGE_THRESH_BAT0 = 80; # 80 and above it stops charging
  #   };
  # };

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
}
