{
  # config,
  pkgs,
  ...
}: {
  imports = [
    ../../home/core.nix

    ../../home/programs
    ../../home/desktop-manager
  ];
}
