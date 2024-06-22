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
        specialArgs = { 
          inherit system; 
          inherit userSettings;
        };
        modules = [
          ./machines/laptop
          ./nixos/profiles/flyingTixos.nix
          # ./users/${userSettings.username}.nix

          home-manager.nixosModules.home-manager
        ];
      };
    };

    homeConfigurations = {
      ${userSettings.username} = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [
          ./home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
          }
        ];
        extraSpecialArgs = {inherit userSettings; };
      };
    };
  };
}
