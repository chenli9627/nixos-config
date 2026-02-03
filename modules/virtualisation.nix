{
  virtualisation = {
    docker = {
      storageDriver = "btrfs";
      enable = true;
      rootless = {
        enable = true;
        setSocketVariable = true;
      };
      daemon.settings.registry-mirrors = [
        "https://docker.m.daocloud.io"
        "https://dockerproxy.com"
        "https://docker.mirrors.ustc.edu.cn"
        "https://docker.nju.edu.cn"
      ];
    };
    # virtualbox = {
    #   host.enable = true;
    #   # do not set this to true avoiding recompiling virtualbox
    #   # host.enableExtensionPack = true;
    #   # it makes rebuild too slow
    #   # guest.enable = true;
    #   guest.dragAndDrop = true;
    # };
  };
  services.spice-vdagentd.enable = true;
  # above line for quickemu
  # users.extraGroups.vboxusers.members = [ username ];
}
