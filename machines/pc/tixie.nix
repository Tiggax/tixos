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
networking = {
  hostName = "tixos";
  nftables.enable = true;
  firewall = {
    enable = true;
    allowedTCPPorts = [80 505 34025];
  };
};

boot = {
  initrd.kernelModules = [ "amdgpu" ];
  kernelPackages = pkgs.linuxPackages_latest;
};


}
