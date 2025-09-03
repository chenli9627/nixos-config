{ lib, pkgs, ... }:
{
  systemd.services.mongodb = {
    wantedBy = lib.mkForce [ ];
    environment = {
      GLIBC_TUNABLES = "glibc.pthread.rseq=0";
    };
  };
  services.mongodb = {
    enable = true;
    package = pkgs.mongodb-ce;
  };
}
