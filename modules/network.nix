{
  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  networking.firewall.enable = false;

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

  networking.extraHosts = "
    0.0.0.0 www.bilibili.com
    0.0.0.0 t.bilibili.com
    0.0.0.0 live.bilibili.com
    0.0.0.0 api.bilibili.com
    0.0.0.0 data.bilibili.com
    0.0.0.0 api.live.bilibili.com
    0.0.0.0 i0.hdslb.com
    0.0.0.0 www.douyin.com
    0.0.0.0 weibo.com
    0.0.0.0 www.v2ex.com
    0.0.0.0 www.xiaohongshu.com
    ";

  programs = {
    clash-verge.enable = true;
    # clash-verge.autoStart = true;
  };

  services.v2raya.enable = true;
}
