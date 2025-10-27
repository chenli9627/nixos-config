{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    # nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    latest.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # hyprland.url = "github:hyprwm/Hyprland";
    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      # IMPORTANT: we're using "libgbm" and is only available in unstable so ensure
      # to have it up-to-date or simply don't specify the nixpkgs input
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # hyprland-plugins = {
    #   url = "github:hyprwm/hyprland-plugins";
    #   inputs.hyprland.follows = "hyprland";
    # };
    stylix = {
      url = "github:nix-community/stylix";
      inputs.nixpkgs.follows = "latest";
    };
    niri = {
      url = "github:sodiboo/niri-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs@{
      self,
      nixpkgs,
      home-manager,
      zen-browser,
      niri,
      ...
    }:
    {
      nixosConfigurations = {
        nixos =
          let
            username = "chen";
            specialArgs = { inherit username; };
          in
          nixpkgs.lib.nixosSystem {
            inherit specialArgs;
            system = "x86_64-linux";
            modules = [
              # ./configuration.nix
              ./hosts/lenovo-laptop
              # ./users/chen

              home-manager.nixosModules.home-manager
              {
                home-manager.useGlobalPkgs = true;
                home-manager.useUserPackages = true;

                # home-manager.users.chen = ./home.nix;
                home-manager.users.${username} = import ./users/${username}/home.nix;

                # home-manager.users.username = import ./users/username/home.nix;

                # 取消注释下面这一行，就可以在 home.nix 中使用 flake 的所有 inputs 参数了
                # home-manager.extraSpecialArgs = inputs // specialArgs;
                home-manager.extraSpecialArgs = {
                  # inherit (inputs) nixpkgs home-manager hyprland;
                  inherit inputs username;
                };
              }
            ];
          };
      };
    };
}
