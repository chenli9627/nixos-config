{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";
    # nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # hyprland.url = "github:hyprwm/Hyprland";
    # hyprland-plugins = {
    #   url = "github:hyprwm/hyprland-plugins";
    #   inputs.hyprland.follows = "hyprland";
    # };
    stylix = {
      url = "github:nix-community/stylix/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    auto-cpufreq = {
      url = "github:AdnanHodzic/auto-cpufreq";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };

  };

  outputs =
    inputs@{
      self,
      nixpkgs,
      home-manager,
      ...
    }:
    {
      nixosConfigurations = {
        xiaoxin =
          let
            username = "chen";
            specialArgs = { inherit username inputs; };
          in
          nixpkgs.lib.nixosSystem {
            inherit specialArgs;
            # system = "x86_64-linux";
            modules = [
              # ./configuration.nix
              ./hosts/lenovo-laptop
              # ./users/chen
              inputs.auto-cpufreq.nixosModules.default

              home-manager.nixosModules.home-manager
              {
                home-manager = {
                  useGlobalPkgs = true;
                  useUserPackages = true;

                  # home-manager.users.chen = ./home.nix;
                  users.${username} = import ./users/${username}/home.nix;

                  # home-manager.users.username = import ./users/username/home.nix;

                  # 取消注释下面这一行，就可以在 home.nix 中使用 flake 的所有 inputs 参数了
                  # home-manager.extraSpecialArgs = inputs // specialArgs;
                  extraSpecialArgs = {
                    inherit inputs username;
                  };
                };
              }
            ];
          };

        thinkpad =
          let
            username = "chen";
            specialArgs = { inherit username inputs; };
          in
          nixpkgs.lib.nixosSystem {
            inherit specialArgs;
            # system = "x86_64-linux";
            modules = [
              # ./configuration.nix
              ./hosts/thinkpad-t14-gen1
              # ./users/chen
              # inputs.nixos-hardware.nixosModules.lenovo-thinkpad-t14-amd-gen1
              inputs.auto-cpufreq.nixosModules.default

              home-manager.nixosModules.home-manager
              {
                home-manager = {
                  useGlobalPkgs = true;
                  useUserPackages = true;

                  # home-manager.users.chen = ./home.nix;
                  users.${username} = import ./users/${username}/home.nix;

                  # home-manager.users.username = import ./users/username/home.nix;

                  # 取消注释下面这一行，就可以在 home.nix 中使用 flake 的所有 inputs 参数了
                  # home-manager.extraSpecialArgs = inputs // specialArgs;
                  extraSpecialArgs = {
                    inherit inputs username;
                  };
                };
              }
            ];
          };
      };
    };
}
