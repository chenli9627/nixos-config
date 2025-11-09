{
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
      "vm.swappiness" = 3;
      "kernel.sysrq" = 1;
    };
    kernelParams = [
      "quite"
      "splash"
    ];
  };

  zramSwap.enable = true; # Creates a zram block device and uses it as a swap device
}
