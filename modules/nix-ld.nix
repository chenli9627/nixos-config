{
  config,
  pkgs,
  username,
  lib,
  ...
}: {
  programs.nix-ld = {
    enable = true;
    libraries = with pkgs; [
      stdenv.cc.cc
      openssl
      zlib
      zstd
      curl
      attr
      libssh
      bzip2
      libxml2
      acl
      libsodium
      util-linux
      xz
      systemd
    ];
  };
}
