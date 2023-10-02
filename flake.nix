{
  description = "my personal NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs }@inputs: 
  let 
    system = "x86_64-linux";

    pkgs = import nixpkgs { 
      inherit system;
      
  in 
  {
    nixosConfigurations = {
      tixos = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs system; };
        modules = [
          ./nixos/configuration.nix
          ./machines/base.nix
        ];
      };
      testing = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs system; };
        modules = [
          ./machines/pc
        ];
      };
    };
  };
}
