{
  programs.auto-cpufreq = {
    enable = true;
    # optionally, you can configure your auto-cpufreq settings, if you have any
    settings = {
      charger = {
        governor = "performance";
        turbo = "auto";
        platform_profile = "performance";
        energy_performance_preference = "performance";
      };

      battery = {
        governor = "powersave";
        turbo = "auto";
        platform_profile = "low-power";
        energy_performance_preference = "power";
        ideapad_laptop_conservation_mode = true;
      };
    };
  };

  powerManagement.enable = true;
  powerManagement.powertop.enable = true;

  # services.power-profiles-daemon.enable = true;

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

  services.logind.settings.Login = {
    HandleLidSwitch = "ignore";
    HandleLidSwitchExternalPower = "ignore";
    HandleLidSwitchDocked = "ignore";
    KillUserProcesses = false;
  };
}
