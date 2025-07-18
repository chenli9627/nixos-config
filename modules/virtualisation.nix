{
  virtualisation = {
    docker = {
      storageDriver = "btrfs";
      enable = true;
      rootless = {
        enable = true;
        setSocketVariable = true;
      };
      daemon.settings.registry-mirrors = [ "https://docker.m.daocloud.io" ];
    };
    virtualbox = {
      host.enable = true;
      # do not set this to true avoiding recompiling virtualbox
      # host.enableExtensionPack = true;
      # it makes rebuild too slow
      # guest.enable = true;
      guest.dragAndDrop = true;
    };
  };
}
