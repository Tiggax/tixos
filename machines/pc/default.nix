{ inputs, lib, pkgs, ... }:
{

  imports = [
    ../base.nix
    ./hardware-configuration.nix
    ./tixie.nix
  ];

  
}
