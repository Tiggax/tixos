{
  description = "my personal NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ nixpkgs, flake-parts, home-manager, ... }:
      let
      system = "x86_64-linux"; 
      pkgs = import nixpkgs { inherit system; }; 
      userSettings = {
        username = "tiggax";
      };

      in
      {
        nixosConfigurations = {
          tixos = nixpkgs.lib.nixosSystem {
            specialArgs = { inherit system; };
            modules = [
              ./nixos/configuration.nix
              ./machines/pc
              # ./profiles/default

              home-manager.nixosModules.home-manager
              {
                home-manager.useGlobalPkgs = true;
                home-manager.useUserPackages = true;
                home-manager.users.tiggax = import ./users/tiggax.nix;
              }
            ];
          };

          flyingTixos = nixpkgs.lib.nixosSystem {
            specialArgs = { inherit system; };

            modules = [
              ./machines/laptop
              ./nixos/profiles/flyingTixos.nix

              home-manager.nixosModules.home-manager
              {
                home-manager.useGlobalPkgs = true;
                home-manager.useUserPackages = true;
                home-manager.users.${userSettings.username} = import ./users/${userSettings.username}.nix;
              }
            ];
            specialArgs = {
              inherit userSettings;
            };
          };
        };
          tixos = nixpkgs.lib.nixosSystem {
            specialArgs = { inherit system; };
            modules = [
              ./nixos/configuration.nix
              ./machines/pc
              # ./profiles/default

              home-manager.nixosModules.home-manager
              {
                home-manager.useGlobalPkgs = true;
                home-manager.useUserPackages = true;
                home-manager.users.tiggax = import ./users/tiggax.nix;
              }
            ];
          };
        };
}
