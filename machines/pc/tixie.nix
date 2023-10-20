{ pkgs, ... }:
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

  # Logitech G502 X mouse config
  environment.systemPackages = with pkgs; [
    solaar 
    piper
  ];
  hardware = {
    logitech.wireless = {
      enable = true;
      enableGraphical = true;
    };
    bluetooth = {
      enable = true;
      powerOnBoot = true;
    };
  };
}