{
  # config,
  pkgs,
  inputs,
  ...
}:
{
  imports = [
    ../../home/core.nix

    ../../home/programs

    ../../home/hyprland
    inputs.walker.homeManagerModules.default
  ];
}
