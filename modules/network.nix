{ pkgs, inputs, ... }:
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

  services = {

    # Enable the OpenSSH daemon.
    # services.openssh.enable = true;
    openssh = {
      enable = true;
      allowSFTP = true;
      startWhenNeeded = true;
      settings = {
        PasswordAuthentication = true;
        PermitRootLogin = "yes";
      };
    };

    resolved = {
      enable = true;
    };

    tailscale = {
      enable = false;
    };

    # v2raya = {
    #   enable = true;
    #   cliPackage = pkgs.xray;
    # };

  };

  environment.systemPackages = with pkgs; [ tailscale ];

  programs = {
    clash-verge = {
      enable = true;
      tunMode = true;
      autoStart = true;
      serviceMode = true;
    };
  };

  # nix.settings = {
  #   substituters = [ "https://cache.garnix.io" ];
  #   trusted-public-keys = [
  #     "cache.garnix.io:CTFPyKSLcx5RMJKfLo5EEPUObbA78b0YQ2DTCJXqr9g="
  #   ];
  # };

}
