{
  description = "my personal NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    rust-overlay.url = "github:oxalica/rust-overlay";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ nixpkgs, home-manager, rust-overlay, ... }: 
  let 
    system = "x86_64-linux";

    pkgs = import nixpkgs { inherit system; };      
  in 
  {
    nixosConfigurations = {
      tixos = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit system; };
        modules = [
          ./nixos/configuration.nix
          ./machines/base.nix
          ({ pkgs, ... }: {
            nixpkgs.overlays = [ rust-overlay.overlays.default ];
            environment.systemPackages = [ pkgs.rust-bin.stable.latest.default ];
          })
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;

            home-manager.users.tiggax = import ./users/tiggax.nix;
          }
        ];
      };
      testing = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit system; };
        modules = [
          ./machines/pc
        ];
      };
    };
  };
}
