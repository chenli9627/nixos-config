# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).
{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ../../modules/system.nix
    ../../modules/gnome.nix
    # ../../modules/hyprland.nix
    ../../modules/nix-ld.nix
    ../../modules/virtualisation.nix

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
  # boot.loader = {
  #   systemd-boot.enable = false;
  #   grub = {
  #     enable = true;
  #     # device = "nixos";
  #     # device = "/dev/disk/by-uuid/7D6C-950A";
  #     device = "nodev";
  #     efiSupport = true;
  #     useOSProber = true;
  #   };
  #   efi = {
  #     canTouchEfiVariables = true;
  #     efiSysMountPoint = "/boot";
  #   };
  # };

  networking.hostName = "nixos"; # Define your hostname.
  # Pick only one of the below networking options.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  networking.networkmanager.enable = true; # Easiest to use and most distros use this by default.
}
