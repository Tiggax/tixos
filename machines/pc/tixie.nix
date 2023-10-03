{config, lib, pkgs, modulesPath, ... }:
{
  fileSystems = {
    "/mnt/Data" = {
      label = "Data";
      fsType = "ntfs";
    };
    "/mnt/Working" = {
      label = "Working";
      fsType = "ext4";
    };
  };
}