# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).
{
  config,
  lib,
  pkgs,
  ...
}:
{
  imports = [
    ../../modules/system.nix
    # ../../modules/gnome.nix
    ../../modules/hyprland.nix
    ../../modules/nix-ld.nix
    ../../modules/virtualisation.nix
    ../../modules/keyd.nix
    # ../../modules/flatpak.nix

    # Include the results of the hardware scan.
    ./hardware-configuration.nix
  ];

  boot.loader = {
    efi.canTouchEfiVariables = true;
    systemd-boot = {
      enable = true;
      consoleMode = "auto";
      configurationLimit = 10;
    };
  };
  boot.kernelParams = [
    "amdgpu.dcdebugmask=0x10"
    "nvme.noacpi=1"
    "nvme_core.default_ps_max_latency_us=0"
    "iommu=soft"
    "pcie_aspm=off"
    "pcie_port_pm=off"
    "mem_sleep_default=deep"
  ];

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

  # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
  # (the default) this is the recommended approach. When using systemd-networkd it's
  # still possible to use this option, but it's recommended to use it in conjunction
  # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
  # networking.useDHCP = lib.mkDefault true;
  # networking.interfaces.wlp1s0.useDHCP = lib.mkDefault true;
  networking = {
    hostName = "nixos"; # Define your hostname.
    # Pick only one of the below networking options.
    wireless.enable = true; # Enables wireless support via wpa_supplicant.
    networkmanager.enable = true; # Easiest to use and most distros use this by default.
    useDHCP = false;
    dhcpcd.enable = false;
    # networkmanager.wifi.powersave = true;
  };

  services.power-profiles-daemon.enable = true;
  services.logind = {
    lidSwitch = "suspend-then-hibernate";
    powerKey = "suspend";
    powerKeyLongPress = "poweroff";
  };
  systemd.sleep = {
    extraConfig = ''
      HibernateDelaySec=30m
      SuspendState=mem
    '';
  };
}
