{config, lib, pkgs, modulesPath, ... }:
{
  filesystems = {
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