{ inputs, lib, pkgs, ... }:
{

  imports = [
    ../base.nix
    ./hardware-configuration.nix
    ./flyingTixos.nix
  ];

  
}
