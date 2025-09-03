{ lib, pkgs, ... }:
{
  systemd.services.mongodb.wantedBy = lib.mkForce [ ];
  services.mongodb = {
    enable = true;
    package = pkgs.mongodb-ce;
  };
}
