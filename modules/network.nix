{ inputs, ... }:
{

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  networking = {
    firewall.enable = false;
    timeServers = [
      "ntp.ntsc.ac.cn"
      "cn.ntp.org.cn"
      "0.nixos.pool.ntp.org"
      "1.nixos.pool.ntp.org"
      "2.nixos.pool.ntp.org"
      "3.nixos.pool.ntp.org"
    ];
  };

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;
  services.openssh = {
    enable = true;
    allowSFTP = true;
    startWhenNeeded = true;
    settings = {
      PasswordAuthentication = true;
      PermitRootLogin = "yes";
    };
  };

  programs = {
    clash-verge.enable = true;
    # clash-verge.autoStart = true;
  };

  # imports = [
  #   inputs.daeuniverse.nixosModules.dae
  #   inputs.daeuniverse.nixosModules.daed
  # ];

  services.daed = {
    enable = true;

    openFirewall = {
      enable = true;
      port = 12345;
    };
  };

  # nix.settings = {
  #   substituters = [ "https://cache.garnix.io" ];
  #   trusted-public-keys = [
  #     "cache.garnix.io:CTFPyKSLcx5RMJKfLo5EEPUObbA78b0YQ2DTCJXqr9g="
  #   ];
  # };

}
