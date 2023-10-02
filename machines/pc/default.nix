{ inputs, lib, pkgs, ... }:
{

  imports = [
    ../base.nix
    ../../pkgs/kde.nix
    ../../pkgs/helix.nix
    ../../pkgs/nushell.nix
    inputs.home-manager.nixosModules.home-manger
  ];

  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users = {
      tiggax = import ./
    };
  };
 
  
}