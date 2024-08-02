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
        specialArgs = { 
          inherit inputs system; 
          inherit userSettings;
        };
        modules = [
          ./machines/pc
          ./nixos/profiles/tixos.nix
          ./users/${userSettings.username}.nix

          home-manager.nixosModules.home-manager
          ./home-manager
        ];
      };

      flyingTixos = nixpkgs.lib.nixosSystem {
        specialArgs = { 
          inherit inputs system; 
          inherit userSettings;
        };
        modules = [
          ./machines/laptop
          ./nixos/profiles/flyingTixos.nix
          ./users/${userSettings.username}.nix

          home-manager.nixosModules.home-manager
          ./home-manager

        ];
      };
    };
  };
}
