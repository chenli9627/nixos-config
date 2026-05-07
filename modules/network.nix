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
    nftables.enable = true;
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
      enable = true;
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

  # Force tailscaled to use nftables (Critical for clean nftables-only systems)
  # This avoids the "iptables-compat" translation layer issues.
  systemd.services.tailscaled.serviceConfig.Environment = [
    "TS_DEBUG_FIREWALL_MODE=nftables"
  ];

  # Optimization: Prevent systemd from waiting for network online
  # (Optional but recommended for faster boot with VPNs)
  systemd.network.wait-online.enable = false;
  boot.initrd.systemd.network.wait-online.enable = false;

}
